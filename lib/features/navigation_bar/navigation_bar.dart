import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/constants/color_constants.dart';

import 'navigation_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final NavBarController _navBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => IndexedStack(
            index: _navBarController.selectedIndex,
            children: _navBarController.pages)),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 30,
                  offset: const Offset(0, -15),
                )
              ],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(bottom: Platform.isIOS ? 0 : 10),
            child: Obx(
              () => BottomNavigationBar(
                  iconSize: 30,
                  currentIndex: _navBarController.selectedIndex,
                  onTap: (index) => _navBarController.changePage(index),
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          _navBarController.selectedIndex == 0
                              ? Icons.home
                              : Icons.home_outlined,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: _navBarController.selectedIndex == 1
                            ? const Icon(Icons.receipt_long)
                            : const Icon(Icons.receipt_long_outlined),
                        label: "History"),
                    BottomNavigationBarItem(
                        icon: _navBarController.selectedIndex == 2
                            ? const Icon(Icons.add)
                            : const Icon(Icons.add_outlined),
                        label: "Request"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          _navBarController.selectedIndex == 3
                              ? Icons.calendar_month
                              : Icons.calendar_month_outlined,
                        ),
                        label: "Scan"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          _navBarController.selectedIndex == 4
                              ? Icons.person
                              : Icons.person_outline,
                        ),
                        label: "Profile"),
                  ]),
            )));
  }
}
