import 'package:bookshop/conrtrollers/signincontroller.dart';
import 'package:flutter/material.dart';
import 'package:bookshop/widgets/CustomButtom.dart';
import 'package:bookshop/widgets/CustomTextfields.dart';

import 'package:get/get.dart';

import 'signupscreen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("Sign In", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/1.png',
                height: 200,
              ),
            ),

            CustomTextfield(
                Text: "Email", controller: controller.emailController),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Obx(() {
              return TextField(
                obscureText: controller.isObsecure.value,
                controller: controller.passController,
                cursorColor: Colors.grey,
                style: TextStyle(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isToggle();
                    },
                    icon: Icon(
                        controller.isObsecure.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey),
                  ),
                  hintText: "password",
                  hintStyle: const TextStyle(
                      fontFamily: "inter", fontSize: 16, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              );
            }),
            SizedBox(
              height: Get.height * 0.08,
            ),
            CustomButton(
              text: "Sign In",
              onPressed: () {
                controller.signin();
              },
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            Center(
              child: Text("Already have an account ?",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignupScreen());
              },
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromRGBO(73, 139, 109, 1),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}