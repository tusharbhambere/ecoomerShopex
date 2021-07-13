import 'package:eccomerce_app/core/api/featch_product.dart';
import 'package:flutter/material.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ProductNotfier extends ChangeNotifier {
  final _apiProduct = new ProductApi();
  List _products = [];
  List get product => _products;
  LoadingStatus loadingStatus = LoadingStatus.searching;
  notifyListeners();

  Future getProducts() async {
    this.loadingStatus = LoadingStatus.searching;
    var products = await _apiProduct.featchProduct();

    _products = products;
    this.loadingStatus = LoadingStatus.completed;
    notifyListeners();
    if (_products.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
      notifyListeners();
    }
  }

  Future loadProductDetails({@required dynamic productID}) async {
    try {
      var products = await _apiProduct.detailProduct(productId: productID);

      return products;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
