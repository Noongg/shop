import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';

Widget customTextFormField({required String title,required Icon icon ,String? Function(String?)? validator, TextEditingController? controller}){
  return SizedBox(
    height: 50,
    width: Get.width,
    child: TextFormField(
      maxLines: 1,
      style: const TextStyle(fontSize: 16),
      validator: validator,
      controller:controller ,
      autofocus: false,
      decoration: InputDecoration(
        hintText: title,
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.colorText, width: 0.3)),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.colorPrimary, width: 1)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        prefixIcon: icon,
      ),
    ),
  );
}