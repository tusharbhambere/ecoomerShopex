import 'package:eccomerce_app/app/providers.dart';
import 'package:eccomerce_app/meta/splash/decider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: provider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom Eccomerce App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: DeciderView(),
      ),
    );
  }
}
