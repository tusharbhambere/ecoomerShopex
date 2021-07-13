import 'package:eccomerce_app/core/notifier/user.info.notifier.dart';
import 'package:eccomerce_app/core/notifier/user.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAdress = TextEditingController();
    final userPhone = TextEditingController();
    var providerUser = Provider.of<UserInfoNotifier>(context, listen: false);
    var userEmail = Provider.of<UserNotifier>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          VxDialog.showCustom(context,
              child: Material(
                child: Container(
                  height: context.percentHeight * 70,
                  width: context.percentWidth * 80,
                  child: VStack([
                    TextField(
                      controller: userAdress,
                      decoration: InputDecoration(hintText: 'User Adress'),
                    ).p16(),
                    TextField(
                      controller: userPhone,
                      decoration: InputDecoration(hintText: 'User no'),
                    ).p16(),
                    50.heightBox,
                    ElevatedButton(
                        onPressed: () async {
                          await providerUser.postuserInfo(
                              useremail: userEmail.cachedUserEmail,
                              useraddress: userAdress.text,
                              userphoneno: userPhone.text);
                        },
                        child: 'Save Info'.text.makeCentered())
                  ]),
                ),
              ));
        },
        child: Icon(Icons.edit),
      ),
      body: Container(
        child: FutureBuilder(
          future: providerUser.userInfo(
              context: context, useremail: userEmail.cachedUserEmail),
          builder: (context, snapshot) {
            print(userEmail.cachedUserEmail);
            return ListView.builder(
                itemCount: providerUser.userData.length,
                itemBuilder: (context, index) {
                  final userinfo = providerUser.userData[index];

                  print(userinfo);
                  print('-------------------------------------');
                  return VStack([
                    'User Info'.text.xl2.bold.make().centered(),
                    Text(userinfo['useraddress']),
                    30.heightBox,
                    Text(userinfo['userphoneno']),
                  ]).safeArea();
                });
          },
        ),
      ),
    );
  }
}
