import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowImage extends StatelessWidget {
  ShowImage({Key? key,required this.file}) : super(key: key);
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Image.file(
          file!,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
