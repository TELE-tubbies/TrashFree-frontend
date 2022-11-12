import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/features/register/register.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/features/request_details/request_details.dart';

import 'features/navigation_bar/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Trash Free',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: materialPrimary,
            scaffoldBackgroundColor: white,
            fontFamily: fontFamily,
            expansionTileTheme: const ExpansionTileThemeData(
                childrenPadding: EdgeInsets.all(20),
                textColor: textColor,
                iconColor: textColor),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: textColor,
                  displayColor: textColor,
                  fontFamily: fontFamily,
                ),
            appBarTheme: const AppBarTheme(
              backgroundColor: white,
              iconTheme: IconThemeData(color: textColor),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: primaryColor,
              selectedIconTheme: IconThemeData(size: 35),
              unselectedItemColor: Colors.grey,
            ),
            listTileTheme: const ListTileThemeData(
                iconColor: textColor, textColor: textColor),
            tabBarTheme: const TabBarTheme(
              unselectedLabelColor: textColor,
            ),
            dividerColor: Colors.grey,
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: white)),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const RegisterPage()),
          GetPage(name: '/navigation_bar', page: () => NavBar()),
          GetPage(name: '/request_details', page: () => const RequestDetails()),
        ]);
  }
}
