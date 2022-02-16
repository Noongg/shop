import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_widget/custom_button.dart';
import 'package:test_1/custom_widget/custom_login_with.dart';
import 'package:test_1/custom_colors.dart';
import 'package:test_1/custom_widget/custom_text_form_field.dart';
import 'package:test_1/custom_widget/text_bold.dart';
import 'package:test_1/custom_widget/text_light.dart';
import 'package:test_1/register.dart';
import 'package:test_1/verification.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.only(left: 16,right: 16,top: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/IconApp2.svg'),
                  const SizedBox(height: 20,),
                  textBold(text: 'Welcome to Lafyuu', color: CustomColors.colorTitle, fontSize: 16),
                  const SizedBox(height: 5,),
                  textLight(text: 'Sign in to continue', color: CustomColors.colorTitle, fontSize: 12),
                  const SizedBox(height: 20,),
                  Form(
                    child: customTextFormField(title: "Your Phone", icon: const Icon(Icons.phone)),
                  ),
                  const SizedBox(height: 20,),
                  customButton(text: "Sign In",callback: (){
                    Get.to(Verification());
                  }),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: Divider(color: CustomColors.colorTitle,thickness: 0.3,)),
                      const SizedBox(width: 20,),
                      textBold(text: 'OR', color: CustomColors.colorTitle, fontSize: 14),
                      const SizedBox(width: 20,),
                      Expanded(child: Divider(color: CustomColors.colorTitle,thickness: 0.3,)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  customLoginWith(text: "Login with Google",assetsImg: "assets/images/Group 121.svg",padding: 70, callback: (){}, ),
                  const SizedBox(height: 10,),
                  customLoginWith(text: "Login with Facebook",assetsImg: "assets/images/Facebook.svg", padding: 50, callback: (){},),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textLight(text: 'Don’t have a account? ', color: CustomColors.colorTitle, fontSize: 12),
                      GestureDetector(
                        child: textBold(text: ' Register', color: CustomColors.colorPrimary, fontSize: 12),
                        onTap: (){
                          Get.to(Register());
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
