import 'dart:convert';

import 'package:eccomerce_app/core/api/user.api.dart';
import 'package:eccomerce_app/meta/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserNotifier extends ChangeNotifier {
  final UserApi _useraPI = new UserApi();

  late String _cachedUserEmail;
  String get cachedUserEmail => _cachedUserEmail;

  Future getUser({required String token, required BuildContext context}) async {
    try {
      await _useraPI.getUser(token: token).then((value) async {
        Map<String, dynamic> parsedData = await jsonDecode(value);

        var userdata = parsedData['data'];
        if (userdata != null) {
          _cachedUserEmail = parsedData['data']['useremail'];
        }
        if (parsedData['data'] == null) {
          context.push((context) => SignupPage());
        }
        notifyListeners();
      });
    } catch (e) {}
  }
}
