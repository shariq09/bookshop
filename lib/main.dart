import 'package:bookshop/colors/Colors.dart';
import 'package:bookshop/image/Images.dart';
import 'package:bookshop/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: "inter",
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Color(0xff498B6D))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
