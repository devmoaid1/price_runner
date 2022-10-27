import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'presentation/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Price Runner',
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: const Color(0xff54328E),
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
