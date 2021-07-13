import 'dart:convert';
import 'dart:io';
import 'package:eccomerce_app/core/services/share_preference.dart';
import 'package:eccomerce_app/meta/Home/home.view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:eccomerce_app/core/api/auth.api.dart';
import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  final AuthServicer _api = AuthServicer();
  final CacheService cacheService = new CacheService();

  //signup
  Future signup(
      {required String username,
      required String useremail,
      required String userpassword,
      required BuildContext context}) async {
    try {
      await _api
          .signUp(
              username: username,
              useremail: useremail,
              userpassword: userpassword)
          .then((value) async {
        Map<String, dynamic> parsedData = await jsonDecode(value.toString());
        print(parsedData);
        bool isAuthenticated = parsedData['authentication'];
        dynamic userData = parsedData['data'];
        if (isAuthenticated) {
          cacheService
              .writtenCache(key: 'jwtdata', value: userData)
              .whenComplete(() {
            context.push((context) => HomeView());
          });
        } else {
          VxBottomSheet.bottomSheetView(context,
              backgroundColor: Vx.purple300,
              child: Container(
                child: Text(
                  userData,
                  style: TextStyle(fontSize: 20),
                ).centered(),
              ));
        }
      });
    } on SocketException {
      print('internet');
    }
  }

  //login
  Future login(
      {required String useremail,
      required String userpassword,
      required BuildContext context}) async {
    try {
      await _api
          .login(useremail: useremail, userpassword: userpassword)
          .then((value) async {
        Map<String, dynamic> parsedData = await jsonDecode(value.toString());
        print(parsedData);
        bool isAuthenticated = parsedData['authentication'];
        dynamic userData = parsedData['data'];
        if (isAuthenticated) {
          cacheService
              .writtenCache(key: 'jwtdata', value: userData)
              .whenComplete(() => context.push((context) => HomeView()));
        } else {
          // VxDialog.showAlert(context, title: 'Fail', content: data);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            userData,
          )));
        }
      });
    } on SocketException {
      print('object');
    }
  }
}
