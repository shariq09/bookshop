import 'dart:developer';

import 'package:bookshop/views/auth/homescreen.dart';
import 'package:bookshop/views/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  var isObsecure = true.obs;
  var isloading = false.obs;
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void isToggle() {
    isObsecure.value = !isObsecure.value;
  }

  void signin() {
    try {
      isloading.value = true;
      auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passController.text.trim())
          .then((value) {
        User? user = value.user;
      }).then((value) {
        Get.snackbar("Success", "Authnticate");
        Get.to(() => const MainScreen());
      }).onError((error, stractrace) {
        Get.snackbar("Error", error.toString());
      });
    } catch (e) {
      log(e.toString());
      isloading.value = false;
    }
  }
}
