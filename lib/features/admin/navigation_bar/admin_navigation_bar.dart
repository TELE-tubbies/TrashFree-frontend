import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/constants/color_constants.dart';

import 'admin_navigation_bar_controller.dart';

class AdminNavBar extends StatelessWidget {
  AdminNavBar({Key? key}) : super(key: key);

  final AdminNavBarController _navBarController =
      Get.put(AdminNavBarController());

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
                  items: [
                    BottomNavigationBarItem(
                        icon: _navBarController.selectedIndex == 0
                            ? const Icon(Icons.event)
                            : const Icon(Icons.event_outlined),
                        label: "Events"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          _navBarController.selectedIndex == 1
                              ? Icons.home
                              : Icons.home_outlined,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          _navBarController.selectedIndex == 2
                              ? Icons.calendar_month
                              : Icons.calendar_month_outlined,
                        ),
                        label: "Schedules"),
                  ]),
            )));
  }
}
