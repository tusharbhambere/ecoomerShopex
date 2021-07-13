import 'package:eccomerce_app/core/notifier/product.notifier.dart';
import 'package:eccomerce_app/meta/Home/home_det.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProductNotfier>(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
      future: state.getProducts(),
      builder: (context, snapshot) => Container(
          child: state.loadingStatus == LoadingStatus.searching
              ? CircularProgressIndicator().centered()
              : state.loadingStatus == LoadingStatus.empty
                  ? Container(
                      child: 'Empty'.text.xl5.make().centered(),
                    ).centered()
                  : ListView.builder(
                      itemCount: state.product.length,
                      itemBuilder: (context, index) {
                        int reverIndex = state.product.length - 1 - index;
                        final product = state.product[reverIndex];
                        return ListTile(
                          onTap: () {
                            context.push((context) => HomeDetail(
                                  item: product,
                                ));
                          },
                          title: Text(product['product_name']),
                          leading: Image.network(
                            product['product_image'],
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ).p16();
                      },
                    )),
    ));
  }
}
