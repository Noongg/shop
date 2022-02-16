import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_1/hello.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Get.to(HelloScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Lottie.asset("assets/images/shopping-green.json",repeat: false),
    );
  }
}
