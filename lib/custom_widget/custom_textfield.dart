import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customTextField({required Icon icon,required String text}){
  return Container(
    height: 50,
    width: Get.width,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffEBF0FF),width: 1,style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(5)
    ),
    child: Row(
      children:  [
        Expanded(child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            prefixIcon: icon
          ),
          maxLines: 1,
        ))
      ],
    ),
  );
}