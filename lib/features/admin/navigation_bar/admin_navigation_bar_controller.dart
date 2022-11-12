import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/admin/request/requests.dart';

import '../events/events.dart';

class AdminNavBarController extends GetxController {
  final _selectedIndex = 1.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int index) => _selectedIndex.value = index;

  final List<Widget> _pages = [
    const Events(),
    const Requests(),
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
