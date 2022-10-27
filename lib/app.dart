import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'presentation/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 813),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            navigatorKey: Get.key,
            title: 'Price Runner',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Montserrat",
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Color(0xff54328E),
              ),
              primaryColor: const Color(0xff54328E),
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: const HomeView(),
          );
        });
  }
}
