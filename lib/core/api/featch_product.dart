import 'dart:convert';

import 'package:eccomerce_app/app/api.routes.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  final client = new http.Client();
  final header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*"
  };

  Future featchProduct() async {
    final http.Response response =
        await client.get(Uri.parse(ApiRoutes.getProduct), headers: header);

    final body = response.body;
    final Map<String, dynamic> data = await jsonDecode(body);
    final productData = data['data'];
    final received = data['received'];
    if (received == true) {
      return productData;
    }
  }

  Future detailProduct({required dynamic productId}) async {
    final String suburl = "/$productId";
    final String url = ApiRoutes.detailPage + suburl;
    final http.Response response =
        await client.get(Uri.parse(url), headers: header);

    final responsse = response.body;
    return responsse;
  }
}
