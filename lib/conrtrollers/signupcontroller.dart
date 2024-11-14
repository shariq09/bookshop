
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isObsecure = true.obs;
  var isloading = false.obs;

  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passController = TextEditingController();


  void isToggle() {
    isObsecure.value = !isObsecure.value;
  }

  
}
