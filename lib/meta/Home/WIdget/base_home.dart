import 'package:flutter/material.dart';

class BaseHome extends StatefulWidget {
  const BaseHome({Key? key}) : super(key: key);

  @override
  BaseHomeState createState() => BaseHomeState();
}

class BaseHomeState<T extends BaseHome> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pageUI(),
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
