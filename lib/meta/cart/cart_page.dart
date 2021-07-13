import 'package:eccomerce_app/core/notifier/cart.notifier.dart';
import 'package:eccomerce_app/core/notifier/user.notifier.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserNotifier>(context, listen: false);
    final _cartData = Provider.of<CartNotifier>(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
      future: _cartData.getCartItem(userEmail: userdata.cachedUserEmail),
      builder: (context, snapshot) {
        return Container(
            child: _cartData.connectionState == LoadingStatus.searching
                ? CircularProgressIndicator().centered()
                : _cartData.connectionState == LoadingStatus.empty
                    ? Container(
                        child: 'empty'.text.black.make(),
                      )
                    : ListView.builder(
                        itemCount: _cartData.cartdata.length,
                        itemBuilder: (context, index) {
                          final product = _cartData.cartdata[index];
                          return ListTile(
                            subtitle: IconButton(
                                onPressed: () {
                                  _cartData.deleteCart(
                                      context: context,
                                      productId: product['product_id']);
                                },
                                icon: Icon(Icons.delete)),
                            title: Text(product['product_name']),
                            trailing: Text(product['product_price']),
                          );
                        },
                      ));
      },
    ));
  }
}
