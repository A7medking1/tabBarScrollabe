import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar_scrollable/home_screen.dart';
import 'package:tabbar_scrollable/tab_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: HomeScreen(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TabBarController>(TabBarController());
  }
}
