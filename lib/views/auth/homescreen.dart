import 'package:bookshop/views/auth/signinscreen.dart';
import 'package:bookshop/views/auth/signupscreen.dart';
import 'package:bookshop/widgets/CustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   "ljahsbvfd",
              //   style: TextStyle(
              //       fontFamily: "DM Serif Text"),
              // ),
              // Image in the center
              Image.asset(
                alignment: Alignment.center,
                'assets/images/1.png',
                height: 200,
              ),
              SizedBox(height: 40),

              CustomButton(
                  text: "Login",
                  onPressed: () {
                    Get.to(() => SigninScreen());
                  }),

              SizedBox(height: 20),
              // Space between buttons
              CustomButton(
                  text: "Signup",
                  onPressed: () {
                    Get.to(() => SignupScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
