import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_runner/core/constants/assets.dart';
import 'package:price_runner/presentation/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>()..getData(),
        builder: (controller) => Column(
          children: [
            Center(
              child: Image.asset(Assets.logoPng),
            )
          ],
        ),
      )),
    );
  }
}
