import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trashfree/features/admin/events/events.dart';
import 'package:trashfree/features/admin/navigation_bar/admin_navigation_bar.dart';
import 'package:trashfree/features/individual/register/register.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/features/individual/request_details/request_details.dart';
import 'package:trashfree/features/individual/shopping_page/item_details.dart';
import 'package:trashfree/features/common/splash_screen/splash_screen.dart';
import 'package:trashfree/features/common/story_onboarding/story_onboarding.dart';

import 'features/individual/navigation_bar/navigation_bar.dart';
import 'features/individual/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize hiveDB
  await Hive.initFlutter();
  await Hive.openBox('SETTINGS');
  await Hive.openBox('USER_DATA');

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
        initialRoute: '/splash_screen',
        getPages: [
          GetPage(name: '/splash_screen', page: () => const SplashScreen()),
          GetPage(
              name: '/story_onboarding', page: () => const OnboardingPage()),
          GetPage(name: '/register_page', page: () => const RegisterPage()),
          GetPage(name: '/navigation_bar', page: () => NavBar()),
          GetPage(name: '/request_details', page: () => const RequestDetails()),
          GetPage(name: '/item_details', page: () => const ItemDetails()),
          GetPage(name: '/profile', page: () => const Profile()),
          GetPage(name: '/admin_navigation_bar', page: () => AdminNavBar()),
          GetPage(name: '/create_event', page: () => const Events()),
        ]);
  }
}
