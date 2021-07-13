import 'dart:convert';

import 'package:eccomerce_app/core/api/user_info.api.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserInfoNotifier extends ChangeNotifier {
  List _userData = [];
  List get userData => _userData;
  final _api = new ApiUser();
  Future postuserInfo(
      {required String useremail,
      required String useraddress,
      required String userphoneno}) async {
    try {
      await _api.postuserInfo(
          useremail: useremail,
          useraddress: useraddress,
          userphoneno: userphoneno);
      //   .then((value) async {
      // Map<String, dynamic> parsedData = await jsonDecode(value);
      // bool isAdded = parsedData['added'];
      // String message = parsedData['message'];

      // if (isAdded == true) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text(message.toString())));
      // } else {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text(message.toString())));
      // }
    } catch (e) {
      print(e);
    }
  }

  Future userInfo(
      {required String useremail, required BuildContext context}) async {
    try {
      await _api.userInfo(useremail: useremail).then((value) async {
        Map<String, dynamic> parsedData = await jsonDecode(value);

        bool isFilled = parsedData['filled'];
        if (isFilled == true) {
          _userData = parsedData['info'];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            _userData.toString(),
            style: TextStyle(color: Vx.white),
          )));
        }

        // String message = parsedData['message'];

        // if (isAdded == true) {

        // } else {
        //   ScaffoldMessenger.of(context)

        // }
      });
    } catch (e) {
      print(e);
    }
  }
}
