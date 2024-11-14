import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String Text;
  const CustomTextfield({super.key, required this.controller, required this.Text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: const Color.fromRGBO(73, 139, 109, 1),
      style: const TextStyle(fontFamily: "inter"),
      decoration: InputDecoration(
        hintText: Text,
        hintStyle:
            TextStyle(fontFamily: "inter", fontSize: 16, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: const Color.fromRGBO(73, 139, 109, 1), strokeAlign: 2),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
