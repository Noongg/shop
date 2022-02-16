import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';
import 'package:test_1/custom_widget/text_bold.dart';
import 'package:test_1/custom_widget/text_light.dart';
import 'package:test_1/custom_widget/text_medium.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          body: Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.only(left: 16,right: 16,top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBold(text: 'Enter your 6-digit code', color: CustomColors.colorTitle, fontSize: 22),
                const SizedBox(height: 10,),
                textLight(text: "Code", color: CustomColors.colorText, fontSize: 16),
                const TextField(
                  maxLines: 1,
                  style:TextStyle(fontSize: 22) ,
                  decoration: InputDecoration(
                    hintText: "- - - - - -",
                    hintStyle: TextStyle(fontSize: 22),

                  ),
                ),
                Expanded(child: Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: (){},
                    child: textMedium(text: 'Resend Code', color: CustomColors.colorPrimary, fontSize: 18),
                  ),
                )),
                const Padding(padding: EdgeInsets.only(bottom: 30)),
              ],
            ),
          ),
          floatingActionButton:  FloatingActionButton(
              backgroundColor: CustomColors.colorPrimary,
              child: const Icon(Icons.arrow_forward_ios),
              onPressed: (){}),
        )
    );
  }
}
