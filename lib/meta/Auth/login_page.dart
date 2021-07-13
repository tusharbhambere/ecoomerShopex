import 'dart:ui';

import 'package:eccomerce_app/core/notifier/auth.notifier.dart';
import 'package:eccomerce_app/meta/Auth/base_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  final TextEditingController useremailContro = TextEditingController();
  final TextEditingController userpasscontro = TextEditingController();
  @override
  Widget pageUI() {
    var state = Provider.of<AuthNotifier>(context, listen: false);
    return Container(
      child: Column(children: [
        Spacer(
          flex: 2,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: 'Log In'.text.white.bold.xl5.make(),
        ).p20(),
        VStack(
          [
            40.heightBox,
            Container(
              height: context.percentHeight * 8,
              decoration: BoxDecoration(
                  color: Vx.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Vx.green500)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: 'Email'),
                controller: useremailContro,
              ).px12(),
            ),
            20.heightBox,
            Container(
              height: context.percentHeight * 8,
              decoration: BoxDecoration(
                  color: Vx.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Vx.green500)),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: 'Password'),
                controller: userpasscontro,
              ).px12(),
            ),
            20.heightBox,
            InkWell(
                onTap: () {
                  if (useremailContro.text.isNotEmpty &&
                      userpasscontro.text.isNotEmpty) {
                    state.login(
                        useremail: useremailContro.text,
                        userpassword: userpasscontro.text,
                        context: context);
                  } else {
                    VxDialog.showAlert(
                      context,
                      content: 'empty',
                      title: 'Fill empty filed',
                    );
                  }
                },
                child: VxBox(child: 'Continue'.text.white.makeCentered())
                    .green400
                    .height(context.percentHeight * 7)
                    .rounded
                    .make()),
            Spacer()
          ],
          crossAlignment: CrossAxisAlignment.center,
        )
            .px24()
            .glassMorphic(blur: 8)
            .box
            .square(320)
            .rounded
            .make()
            .centered(),
        Spacer(),
      ]),
    );
  }
}
