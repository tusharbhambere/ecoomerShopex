import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  String pageTitle = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('assets/photo/model.jpg'),
              fit: BoxFit.scaleDown)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: pageUI(),
      ),
    );
  }

  Widget? pageUI() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
