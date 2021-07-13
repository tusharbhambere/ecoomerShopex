import 'package:eccomerce_app/core/notifier/cart.notifier.dart';
import 'package:eccomerce_app/core/notifier/user.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final dynamic item;

  const HomeDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context, listen: false);
    var _provider = Provider.of<CartNotifier>(context, listen: false);
    final String name = userData.cachedUserEmail;
    return Scaffold(
      body: Container(
        child: VStack([
          Image.network(item['product_image']),
          Text(item['product_name']),
          Spacer(),
          ElevatedButton(
                  onPressed: () {
                    print(item['product_name']);
                    _provider.addToCart(
                        useremail: name,
                        productprice: item['product_price'],
                        productname: item['product_name']);
                  },
                  child: 'Buy'.text.make())
              .centered(),
          Spacer()
        ]).safeArea(),
      ),
    );
  }
}
