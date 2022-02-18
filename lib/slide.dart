import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:test_1/custom_widget/text_light.dart';

import 'custom_colors.dart';
import 'custom_widget/text_bold.dart';
import 'custom_widget/text_medium.dart';

class Slide extends StatefulWidget {
  Slide({Key? key}) : super(key: key);

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int defaultChoiceIndex = 0;
  int selectIndex = 0;
  final List<String> _choicesList = ['All', 'Pending', 'Accepted'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultChoiceIndex = 0;
    startTimer();
  }


  DateTime startTime = DateTime(2022, 03, 03);
  late Duration remaining ;
  late Timer t;
  int days = 0, hrs = 0, mins = 0;

  startTimer() async {
    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(mounted){
        setState(() {
          remaining = startTime.difference(DateTime.now());
          mins = remaining.inMinutes;
          hrs = mins >= 60 ? mins ~/ 60 : 0;
          days = hrs >= 24 ? hrs ~/ 24 : 0;
          hrs = hrs % 24;
          mins = mins % 60;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Builder(builder: (context) {
                return Stack(
                  children: [
                    SizedBox(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.gif',
                        image: e,
                        fit: BoxFit.cover,
                      ),
                      height: Get.height,
                      width: Get.width,
                    ),
                    e == imgList[0]
                        ? Positioned(
                        left: 20,
                        top: 50,
                        child: SizedBox(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                textBold(
                                    text: "Super Flash Sale\n50% Off",
                                    color: Colors.white,
                                    fontSize: 24),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(
                                              5)),
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 8,
                                          left: 8),
                                      child: Column(
                                        children: [
                                          textBold(
                                              text: "$days",
                                              color: CustomColors
                                                  .colorTitle,
                                              fontSize: 12),
                                          textBold(
                                              text: "Days",
                                              color: CustomColors
                                                  .colorTitle,
                                              fontSize: 12),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    textBold(
                                        text: ":",
                                        color: Colors.white,
                                        fontSize: 20),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(
                                              5)),
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 8,
                                          left: 8),
                                      child: Column(
                                        children: [
                                          textBold(
                                              text: "$hrs",
                                              color: CustomColors
                                                  .colorTitle,
                                              fontSize: 12),
                                          textBold(
                                              text: "Hours",
                                              color: CustomColors
                                                  .colorTitle,
                                              fontSize: 12),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    textBold(
                                        text: ":",
                                        color: Colors.white,
                                        fontSize: 20),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(
                                              5)),
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 8,
                                          left: 8),
                                      child: Column(
                                        children: [
                                          textBold(
                                              text: "$mins",
                                              color: CustomColors
                                                  .colorTitle,
                                              fontSize: 12),
                                          textBold(
                                              text: "Minutes",
                                              color: CustomColors
                                                  .colorTitle,
                                              fontSize: 12),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )))
                        : const Positioned(child: Text("")),
                    e == imgList[1]
                        ? Positioned(
                        left: 20,
                        top: 50,
                        child: textBold(
                            text: "Flash Sale",
                            color: Colors.white,
                            fontSize: 24))
                        : const Positioned(child: Text("")),
                  ],
                );
              }))
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (v, r) {
                  setState(() {
                    selectIndex = v;
                  });
                },
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: const Duration(milliseconds: 200),
                height: 250,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((e) {
                int index = imgList.indexOf(e);
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectIndex == index
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4)),
                );
              }).toList(),
            ),
            Wrap(
              spacing: 8,
              children: List.generate(_choicesList.length, (index) {
                return ChoiceChip(
                  label: defaultChoiceIndex == index
                      ? textBold(
                      text: _choicesList[index],
                      color: CustomColors.colorPrimary,
                      fontSize: 14)
                      : textMedium(
                      text: _choicesList[index],
                      color: CustomColors.colorText,
                      fontSize: 14),
                  selected: defaultChoiceIndex == index,
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      side: defaultChoiceIndex == index
                          ? BorderSide.none
                          : BorderSide(color: CustomColors.colorText, width: 0.2),
                      borderRadius: BorderRadius.circular(5)),
                  selectedColor: const Color.fromARGB(80, 64, 191, 255),
                  backgroundColor: Colors.transparent,
                  onSelected: (value) {
                    setState(() {
                      defaultChoiceIndex = value ? index : defaultChoiceIndex;
                    });
                  },
                  // backgroundColor: color,
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              fit: FlexFit.loose,
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.55,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 20.0
                ),
                itemBuilder: (context,index){
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                        Border.all(color: CustomColors.colorText, width: 0.5)),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image:
                            "https://anhducdigital.vn/media/news/1607_Untitled-11.jpg",
                            height: 120,
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        textBold(
                            text: "Nike Air Max 270\nReact ENG",
                            color: CustomColors.colorTitle,
                            fontSize: 12),
                        const SizedBox(
                          height: 5,
                        ),
                        RatingBar.builder(
                          allowHalfRating: false,
                          ignoreGestures: true,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.all(0) ,
                          itemSize: 15,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            size: 23,
                            color: Color(0xffFFC833),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        textBold(
                            text: "\$299,43",
                            color: CustomColors.colorPrimary,
                            fontSize: 12),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textLight(text: "\$534,33", color: CustomColors.colorText, fontSize: 12,textDecoration: TextDecoration.lineThrough),
                            textBold(text: "24% Off", color: CustomColors.colorSecond, fontSize: 12),
                            GestureDetector(
                                onTap: (){},
                                child:  Icon(Icons.delete_outline,color: CustomColors.colorText,))
                          ],
                        )
                      ],
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
