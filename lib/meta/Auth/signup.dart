import 'package:eccomerce_app/core/notifier/auth.notifier.dart';
import 'package:eccomerce_app/meta/Auth/base_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends BasePage {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<SignupPage> {
  final TextEditingController usernameContro = TextEditingController();
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
          child: 'Sign Up'.text.white.bold.xl5.make(),
        ).p20(),
        VStack(
          [
            10.heightBox,
            "Loos like you don't have an acount\nLet's Create New Acount"
                .text
                .xl
                .white
                .make(),
            10.heightBox,
            Container(
              height: context.percentHeight * 7,
              decoration: BoxDecoration(
                  color: Vx.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Vx.green500)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: 'UserName'),
                controller: usernameContro,
              ).px12(),
            ),
            10.heightBox,
            Container(
              height: context.percentHeight * 7,
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
            10.heightBox,
            Container(
              height: context.percentHeight * 7,
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
            10.heightBox,
            RichText(
              text: TextSpan(
                  text: "By selecting Agree and Continue below,\nI agree ",
                  children: [
                    TextSpan(
                        text: "to Terms service and privacy",
                        style: TextStyle(color: Vx.green400))
                  ]),
            ),
            10.heightBox,
            InkWell(
                onTap: () {
                  if (usernameContro.text.isNotEmpty &&
                      useremailContro.text.isNotEmpty &&
                      userpasscontro.text.isNotEmpty) {
                    state.signup(
                        username: usernameContro.text,
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
          crossAlignment: CrossAxisAlignment.start,
        )
            .px24()
            .glassMorphic(blur: 8)
            .box
            .square(350)
            .rounded
            .make()
            .centered(),
        Spacer(),
      ]),
    );
  }
}
