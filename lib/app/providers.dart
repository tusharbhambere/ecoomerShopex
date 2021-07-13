import 'package:eccomerce_app/core/notifier/auth.notifier.dart';
import 'package:eccomerce_app/core/notifier/cart.notifier.dart';
import 'package:eccomerce_app/core/notifier/home_tab.notifier.dart';
import 'package:eccomerce_app/core/notifier/product.notifier.dart';
import 'package:eccomerce_app/core/notifier/user.info.notifier.dart';
import 'package:eccomerce_app/core/notifier/user.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> provider = [
  ChangeNotifierProvider<AuthNotifier>(create: (_) => AuthNotifier()),
  ChangeNotifierProvider<ProductNotfier>(create: (_) => ProductNotfier()),
  ChangeNotifierProvider<UserNotifier>(create: (_) => UserNotifier()),
  ChangeNotifierProvider<CartNotifier>(create: (_) => CartNotifier()),
  ChangeNotifierProvider<UserInfoNotifier>(create: (_) => UserInfoNotifier()),
  ChangeNotifierProvider<BottomNotifier>(create: (_) => BottomNotifier()),
];
