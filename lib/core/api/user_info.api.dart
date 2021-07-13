import 'dart:convert';

import 'package:eccomerce_app/app/api.routes.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  final client = new http.Client();
  final header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*"
  };

  Future postuserInfo(
      {required String useremail,
      required String useraddress,
      required String userphoneno}) async {
    final http.Response response =
        await client.post(Uri.parse(ApiRoutes.userpostinfo),
            headers: header,
            body: jsonEncode({
              "useremail": useremail,
              "useraddress": useraddress,
              "userphoneno": userphoneno,
            }));
    print(response);
    return response.body;
  }

  Future userInfo({required String useremail}) async {
    final userl = ApiRoutes.usergetinfo + '$useremail';
    final http.Response response = await client.get(
      Uri.parse(userl),
      headers: header,
    );
    print(response);
    return response.body;
  }
}
