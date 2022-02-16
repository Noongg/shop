import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';

Widget customTextFormField({required String name,required Icon icon ,String? Function(String?)? validator}){
  return SizedBox(
    height: 50,
    width: Get.width,
    child: TextFormField(
      maxLines: 1,
      style: const TextStyle(fontSize: 18),
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.colorText, width: 0.5)),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.colorPrimary, width: 1)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        hintText:name,
        prefixIcon: icon,
      ),
    ),
  );
}