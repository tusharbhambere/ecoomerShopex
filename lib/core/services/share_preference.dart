import 'package:eccomerce_app/meta/splash/decider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class CacheService {
  Future readCache({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var chachedData = sharedPreferences.getString(key);
    return chachedData;
  }

  Future writtenCache({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future deletedCache(
      {required String key, required BuildContext context}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key).whenComplete(() {
      context.push((context) => DeciderView());
    });
  }
}
