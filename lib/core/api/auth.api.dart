import 'dart:convert';

import 'package:eccomerce_app/app/api.routes.dart';
import 'package:http/http.dart' as http;

class AuthServicer {
  final client = http.Client();
  final header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*"
  };
  //signup
  Future signUp(
      {required String username,
      required String useremail,
      required String userpassword}) async {
    final http.Response response = await client.post(
        Uri.parse(ApiRoutes.signUp),
        headers: header,
        body: jsonEncode({
          "username": username,
          "useremail": useremail,
          "userpassword": userpassword
        }));
    return response.body;
  }

  //login
  Future login({required useremail, required userpassword}) async {
    final http.Response response = await client.post(Uri.parse(ApiRoutes.login),
        headers: header,
        body: jsonEncode({
          "useremail": useremail,
          "newuserpassword": userpassword,
        }));
    return response.body;
  }
}
