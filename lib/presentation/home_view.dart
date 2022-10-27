import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:price_runner/core/constants/app_constats.dart';
import 'package:price_runner/core/constants/assets.dart';
import 'package:price_runner/presentation/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeBody());
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Assets.logoPng,
                  width: 116.w,
                  height: 16.h,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Image.network(
                  "${AppConstants.imagePathPrefix}${controller.product!.imagePath}",
                  width: 163.w,
                  height: 196.h,
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
