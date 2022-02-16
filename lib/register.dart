import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';
import 'package:test_1/custom_widget/custom_button.dart';
import 'package:test_1/custom_widget/custom_text_form_field.dart';
import 'package:test_1/hello.dart';

import 'custom_widget/text_bold.dart';
import 'custom_widget/text_light.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  String validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "";
  }

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
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/IconApp2.svg'),
                  const SizedBox(height: 20,),
                  textBold(text: 'Let’s Get Started', color: CustomColors.colorTitle, fontSize: 16),
                  const SizedBox(height: 5,),
                  textLight(text: 'Create an new account', color: CustomColors.colorTitle, fontSize: 12),
                  const SizedBox(height: 20,),
                  Form(child: Column(
                    children: [
                      customTextFormField(title: "Full Name", icon: const Icon(Icons.person) ),
                      const SizedBox(height: 20,),
                      customTextFormField(title: "Your Phone", icon: const Icon(Icons.phone),validator: validateMobile),
                      const SizedBox(height: 20,),
                      customTextFormField(title: "Address", icon: const Icon(Icons.location_on_outlined)),

                    ],
                  )),
                  const SizedBox(height: 30,),
                  customButton(text: "Sign Up", callback: (){}),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textLight(text: "Have a account?", color: CustomColors.colorText, fontSize: 12),
                      GestureDetector(
                        onTap: (){
                          Get.to(HelloScreen());
                        },
                        child: textBold(text: " Sign In", color: CustomColors.colorPrimary, fontSize: 14),
                      )
                    ],
                  ))
                ],
              )
            ),
          ),
        )
    );
  }
}
