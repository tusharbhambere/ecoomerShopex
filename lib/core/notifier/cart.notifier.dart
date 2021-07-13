import 'dart:convert';

import 'package:eccomerce_app/core/api/cart.dart';
import 'package:eccomerce_app/meta/cart/cart_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class CartNotifier extends ChangeNotifier {
  final _api = new CartApi();
  //
  List _cartData = [];
  List get cartdata => _cartData;

  bool _isCartempty = false;
  bool get iscartEmpty => _isCartempty;

  dynamic _cartTotal = 00;
  dynamic get cartTotla => _cartTotal;
  LoadingStatus connectionState = LoadingStatus.searching;
  notifyListeners();

  Future addToCart(
      {required String useremail,
      required String productprice,
      required String productname}) async {
    final result = await _api.addToCart(
        useremail: useremail,
        productprice: productprice,
        productname: productname);
  }

  Future getCartItem({required String userEmail}) async {
    this.connectionState = LoadingStatus.searching;
    await _api.getCartItem(userEmail: userEmail).then((value) async {
      Map<String, dynamic> parsedData = await jsonDecode(value);
      print(parsedData);
      bool received = parsedData['received'];
      bool filled = parsedData['filled'];
      if (received && filled == true) {
        _cartTotal = parsedData['total']
            .toString()
            .replaceAll("{sum", "")
            .replaceAll("}", "");
        _cartData = parsedData['data'];
      }
      this.connectionState = LoadingStatus.completed;
      notifyListeners();
      if (_cartData.isEmpty) {
        this.connectionState = LoadingStatus.empty;
        notifyListeners();
      }
    });
  }

  Future deleteCart(
      {required BuildContext context, required var productId}) async {
    await _api.deleteCart(productId: productId).whenComplete(() {
      context.push((context) => CartPage());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Deleted'),
      ));
    });
  }
}
