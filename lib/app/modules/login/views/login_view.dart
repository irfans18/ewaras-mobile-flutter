import 'package:ewarasm/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'LovioTech',
          style: headerTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: ListView(children: [
          Text(
            'Welcome to',
            style: headerTextStyle.copyWith(fontWeight: semiBold),
            textAlign: TextAlign.center,
          ),
          Text(
            'LovIoTech Health Care',
            style: headerTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 60,
          ),
          Placeholder(
            color: headerTextColor,
            fallbackHeight: 350,
            // fallbackWidth: 10,
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
            child: Text('Login', style: buttonTextStyle.copyWith(color: whiteColor)),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              // foregroundColor: buttonTextColor,
              backgroundColor: headerTextColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            onPressed: () => controller.handleSignIn(),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            child: Text('Register', style: buttonTextStyle.copyWith(color: headerTextColor)),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              // foregroundColor: buttonTextColor,
              // backgroundColor: headerTextColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
                  side: BorderSide(color: headerTextColor)
            ),
            onPressed: () => controller.redirectToRegister(),
          ),
        ]),
      ),
    );
  }
}
