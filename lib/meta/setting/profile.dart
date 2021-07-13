import 'package:eccomerce_app/core/services/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CacheService cacheService = new CacheService();
    return Scaffold(
      body: VStack([
        ElevatedButton(
            onPressed: () {
              cacheService.deletedCache(key: 'jwtdata', context: context);
            },
            child: 'Remove'.text.make())
      ]),
    );
  }
}
