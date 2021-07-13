import 'dart:convert';

import 'package:eccomerce_app/app/api.routes.dart';
import 'package:http/http.dart' as http;

class CartApi {
  final client = new http.Client();
  final header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*"
  };

  Future addToCart(
      {required String useremail,
      required String productprice,
      required String productname}) async {
    final http.Response response =
        await client.post(Uri.parse(ApiRoutes.addtocart),
            headers: header,
            body: jsonEncode({
              "useremail": useremail,
              "product_price": productprice,
              "product_name": productname
            }));

    // final responsed = response.body;

    // print(responsed);
  }

  Future getCartItem({required String userEmail}) async {
    final String suburl = '$userEmail';
    final String finalurl = ApiRoutes.getcartITem + suburl;
    final http.Response response =
        await client.get(Uri.parse(finalurl), headers: header);
    return response.body;
  }

  Future deleteCart({required var productId}) async {
    final suburl = ApiRoutes.deletecartItem + '/$productId';

    final http.Response response =
        await client.delete(Uri.parse(suburl), headers: header);
    print(response);
  }
}
