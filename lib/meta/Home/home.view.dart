import 'package:eccomerce_app/app/constant.dart';
import 'package:eccomerce_app/core/notifier/home_tab.notifier.dart';
import 'package:eccomerce_app/core/notifier/user.notifier.dart';
import 'package:eccomerce_app/core/services/share_preference.dart';
import 'package:eccomerce_app/meta/Home/home_page.dart';
import 'package:eccomerce_app/meta/cart/cart_page.dart';
import 'package:eccomerce_app/meta/setting/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CacheService _cacheService = new CacheService();

  void initState() {
    getuser();

    super.initState();
  }

  getuser() async {
    final userData = Provider.of<UserNotifier>(context, listen: false);
    _cacheService
        .readCache(key: 'jwtdata')
        .then((token) => userData.getUser(token: token, context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      bottomNavigationBar: getFolttor(),
      appBar: AppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    final state = Provider.of<BottomNotifier>(context, listen: true);
    return IndexedStack(
      index: state.currentIndex,
      children: [
        HomePage(),
        CartPage(),
        Center(
          child: 'cart'.text.make(),
        ),
        Profile()
      ],
    );
  }

  Widget getFolttor() {
    final state = Provider.of<BottomNotifier>(context, listen: true);

    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Vx.white,
          border: Border(top: BorderSide(color: Vx.gray400.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iteamTab.length, (index) {
            return IconButton(
                color: state.currentIndex == index ? Vx.red600 : Vx.black,
                onPressed: () {
                  state.currentIndex = index;
                },
                icon: Icon(
                  iteamTab[index]["icon"],
                  size: iteamTab[index]["size"],
                ));
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    getuser();
    super.dispose();
  }
}
