import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNav extends GetView<ControllerNav> {
  BottomNav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerNav>(
        init: ControllerNav(),
        builder: (data) => WillPopScope(
          onWillPop: () async {
            if (data.currentIndex != 0) {
              data.changeTabIndex(0);
            } else {
              SystemNavigator.pop();
              return false;
            }
            return false;
          },
          child: Scaffold(
            body: IndexedStack(
              index: data.currentIndex,
              children: [
                // HomeScreen(), //0
                // Explorer(), //1
                // Cart(),
                // Favourite(),
                // Account() //2
              ],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 1.00), //(x,y)
                      blurRadius: 4.00,
                      color: Colors.grey,
                      spreadRadius: 1.00),
                ],
              ),
              child: BottomNavigationBar(
                elevation: 0,
                currentIndex: data.currentIndex,
                onTap: (index) {
                  data.changeTabIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/home.svg'),
                    label: 'Home',
                    activeIcon: SvgPicture.asset(
                      'assets/images/home.svg',
                      color: Color(0xff53B175),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/explore.svg'),
                    label: 'Explore',
                    activeIcon: SvgPicture.asset(
                      'assets/images/explore.svg',
                      color: Color(0xff53B175),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/cart.svg'),
                    label: 'Cart',
                    activeIcon: SvgPicture.asset(
                      'assets/images/cart.svg',
                      color: Color(0xff53B175),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/favourite.svg'),
                    label: 'Favourite',
                    activeIcon: SvgPicture.asset(
                      'assets/images/favourite.svg',
                      color: Color(0xff53B175),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/account.svg'),
                    label: 'Account',
                    activeIcon: SvgPicture.asset(
                      'assets/images/account.svg',
                      color: Color(0xff53B175),
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                selectedItemColor: Color(0xff53B175),
                showUnselectedLabels: true,
                selectedFontSize: 12,
                unselectedItemColor: Colors.black,
                showSelectedLabels: true,
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ));
  }
}


class ControllerNav extends GetxController{
  int currentIndex=0;

  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}