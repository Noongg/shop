import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_colors.dart';
import 'package:test_1/custom_widget/custom_text_form_field.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isCheck = false;
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: Get.width,
                child: TextField(
                  onTap: (){
                    setState(() {
                      isCheck=true;
                    });
                  },
                  controller: controller,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                  autofocus: false,
                  decoration: InputDecoration(
                    suffixIcon: isCheck?IconButton(onPressed: (){
                      setState(() {
                        isCheck=false;
                        controller.clear();
                      });
                    }, icon: const Icon(Icons.cancel)):const Text(""),
                    hintText: "Search",
                    contentPadding: const EdgeInsets.all(0),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: CustomColors.colorText, width: 0.3)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: CustomColors.colorPrimary, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColors.colorPrimary,
                    ),
                  ),
                ),
              ),
              isCheck
                  ? Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 12,
                          itemBuilder: (context, index) => Container(
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.only(top: 20),
                                color: Colors.yellow,
                                child: const Text("hahaha"),
                              )),
                    )
                  : Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 12,
                          itemBuilder: (context, index) => Container(
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.only(top: 20),
                                color: Colors.red,
                                child: const Text("hahaha"),
                              )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
