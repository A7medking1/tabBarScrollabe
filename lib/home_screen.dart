import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar_scrollable/tabar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Get.to(()=> const MainTabBarScreen());
          },
          child: const Text('TAB'),
        ),
      ),
    );
  }
}
