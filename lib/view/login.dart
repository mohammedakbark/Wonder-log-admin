import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/auth_controller.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/const.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/navigation.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/logo.dart';
import 'package:wanderlog_admin/view/widgets/padding.dart';
import 'package:wanderlog_admin/view/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final aspectration = size.aspectRatio;
    return Scaffold(
      backgroundColor: APP_THEME_COLOR,
      body: CustomePadding(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AuthController>(builder: (context, authController, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in now",
                    style: normalStyle(
                        fontsize: 33,
                        fontWeight: FontWeight.w600,
                        color: WHITE),
                  ),
                  Text(
                    "Please sign in to continue our app",
                    style: normalStyle(color: WHITE),
                  ),
                  SizedBox(
                    height: height * .06,
                  ),
                  customeTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the required field";
                        } else if (!(regEx.hasMatch(value))) {
                          return "The Email is not valid";
                        } else {
                          return null;
                        }
                      },
                      controller: authController.emailcontroller,
                      hintText: "Email",
                      width: width * .2),
                  SizedBox(
                    height: height * .03,
                  ),
                  customeTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the required field";
                        } else if (value.length < 8) {
                          return "Password required minimum 8 digit";
                        } else {
                          return null;
                        }
                      },
                      controller: authController.passwordcontroller,
                      obscureText: authController.obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          authController.isTextVisible();
                        },
                        icon: Icon(authController.obscureText
                            ? Icons.remove_red_eye_sharp
                            : CupertinoIcons.eye_slash_fill),
                        color: GREY,
                      ),
                      hintText: "Password",
                      width: width * .2),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: normalStyle(
                              color: GREY, fontWeight: FontWeight.w500),
                        )),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  customeElevtedButton(
                      width: width * .2,
                      height: height,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => NavigationPage(),
                            ),
                            (route) => false);
                      },
                      text: "Sign in",
                      textColor: WHITE,
                      bgColor: DARK_BLUE_COLOR)
                ],
              );
            }),
            SizedBox(
              width: width * .2,
            ),
            appLogo(aspectration),
          ],
        ),
      ),
    );
  }
}
