import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/individual/shopping_page/shopping_page.dart';

import '../homescreen/homescreen.dart';
import '../request_history/request_history.dart';
import '../request_page/request_page.dart';

class NavBarController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int index) => _selectedIndex.value = index;

  final List<Widget> _pages = [
    const Homescreen(),
    const RequestHistory(),
    const RequestPage(),
    Container(
      color: Colors.yellow,
      height: deviceHeight,
      width: deviceWidth,
    ),
    const ShoppingPage(),
  ];

  List<Widget> get pages => _pages;

  void changePage(int index) {
    selectedIndex = index;
  }
}
