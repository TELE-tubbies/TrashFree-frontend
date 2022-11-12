import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../homescreen/homescreen.dart';

class NavBarController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int index) => _selectedIndex.value = index;

  final List<Widget> _pages = [
    const Homescreen(),
    Container(
      color: Colors.blue,
      height: deviceHeight,
      width: deviceWidth,
    ),
    Container(
      color: Colors.green,
      height: deviceHeight,
      width: deviceWidth,
    ),
    Container(
      color: Colors.purple,
      height: deviceHeight,
      width: deviceWidth,
    ),
    Container(
      color: Colors.yellow,
      height: deviceHeight,
      width: deviceWidth,
    ),
  ];

  List<Widget> get pages => _pages;

  void changePage(int index) {
    selectedIndex = index;
  }
}
