import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';
import 'package:test_1/custom_widget/text_bold.dart';
import 'package:test_1/verification.dart';

Widget customButton({required String text,required VoidCallback callback}){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width, 57),
        primary: CustomColors.colorPrimary
      ),
      onPressed:callback,
      child: textBold(text: text, color: Colors.white, fontSize: 14));
}