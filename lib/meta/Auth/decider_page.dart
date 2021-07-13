import 'package:eccomerce_app/app/constant.dart';
import 'package:eccomerce_app/meta/Auth/base_page.dart';
import 'package:eccomerce_app/meta/Auth/login_page.dart';
import 'package:eccomerce_app/meta/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthDecider extends BasePage {
  const AuthDecider({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<AuthDecider> {
  @override
  Widget pageUI() {
    return Container(
      child: Column(children: [
        Spacer(
          flex: 2,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: 'Hi..!'.text.white.bold.xl5.make(),
        ).p20(),
        VStack(
          [
            10.heightBox,
            'Welcome to Shopex'.text.xl2.extraBold.make().shimmer(
                  primaryColor: Vx.orange400,
                  secondaryColor: Vx.teal400,
                  duration: Duration(seconds: 5),
                ),
            10.heightBox,
            InkWell(
                onTap: () {
                  context.push((context) => LoginPage());
                },
                child: VxBox(
                        child: 'Login'
                            .text
                            .semiBold
                            .black
                            .letterSpacing(2)
                            .xl2
                            .makeCentered())
                    .color(Constants.pwhite)
                    .height(context.percentHeight * 7)
                    .roundedSM
                    .make()),
            Spacer(),
            InkWell(
                onTap: () {
                  context.push((context) => SignupPage());
                },
                child: VxBox(
                        child: 'Signup'
                            .text
                            .semiBold
                            .letterSpacing(2)
                            .black
                            .xl2
                            .makeCentered())
                    .color(Constants.pwhite)
                    .height(context.percentHeight * 7)
                    .roundedSM
                    .make()),
            Spacer(
              flex: 2,
            ),
          ],
          crossAlignment: CrossAxisAlignment.center,
        )
            .px24()
            .glassMorphic(blur: 8)
            .box
            .square(270)
            .rounded
            .make()
            .centered(),
        Spacer(),
      ]),
    );
  }
}
