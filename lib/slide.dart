import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  late int defaultChoiceIndex;
  final List<String> _choicesList = ['All', 'Pending', 'Accepted'];
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: imgList
                .map((e) => Builder(builder: (context) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Image.network(e, fit: BoxFit.cover),
                            if (e == imgList[0])
                              const Text("Super Flash Sale 50% Off")
                          ],
                        ),
                      );
                    }))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: const Duration(milliseconds: 200),
              height: 300,
            ),
          ),
          Wrap(
            spacing: 8,
            children: List.generate(_choicesList.length, (index) {
              return ChoiceChip(
                label: defaultChoiceIndex == index
                    ?textBold(text: _choicesList[index], color: CustomColors.colorPrimary, fontSize: 14)
                    :textMedium(text: _choicesList[index], color: CustomColors.colorText, fontSize: 14),
                selected: defaultChoiceIndex == index,
                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                shape: RoundedRectangleBorder(
                    side: defaultChoiceIndex == index?BorderSide.none:BorderSide(color: CustomColors.colorText,width: 0.2),
                    borderRadius: BorderRadius.circular(5)
                ),
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
          RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 100,
              divisions: 10,

              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (newValue){
                setState(() {
                  _currentRangeValues = newValue;
                });
              })
        ],
      ),
    );
  }
}
