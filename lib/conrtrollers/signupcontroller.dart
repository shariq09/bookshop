// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:livechat/view/loginscreen.dart';

import 'dart:developer';
import 'package:bookshop/views/auth/signinscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
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

  void signup() {
    try {
      isloading.value = true;
      auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passController.text.trim())
          .then((value) async {
        await FirebaseFirestore.instance.collection("users").doc().set({
          "email": emailController.text.trim(),
          "password": passController.text.trim(),
          "firstName": firstnameController.text.trim(),
          "lastName": lastnameController.text.trim(),
          "uid": value.user!.uid
        }).then((value) {
          isloading.value = false;
          Get.snackbar("Success", "User Registration.");
          Get.to(() => const SigninScreen());
        });
      });
    } catch (e) {
      log(e.toString());
      isloading.value = false;
    }
  }
}
