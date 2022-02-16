import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';
import 'package:test_1/custom_widget/text_bold.dart';

Widget customLoginWith({required String text,required String assetsImg,required double padding,required VoidCallback callback}){
  return OutlinedButton.icon(
    style:OutlinedButton.styleFrom(
      minimumSize: Size(Get.width, 57),
    ) ,
      onPressed: (){
        callback;
      },
      label: Padding(padding: const EdgeInsets.only(right: 60),child: textBold(text: text, color: CustomColors.colorText, fontSize: 14),),
      icon:  Padding(padding: EdgeInsets.only(right: padding),child: SvgPicture.asset(assetsImg),),
      );
}