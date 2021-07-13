import 'package:eccomerce_app/core/services/share_preference.dart';
import 'package:eccomerce_app/meta/Auth/decider_page.dart';
import 'package:eccomerce_app/meta/Home/home.view.dart';
import 'package:flutter/material.dart';

class DeciderView extends StatelessWidget {
  const DeciderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CacheService().readCache(key: 'jwtdata'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeView();
        } else {
          return AuthDecider();
        }
      },
    );
  }
}
