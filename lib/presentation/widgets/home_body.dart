import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/app_constats.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../home_view.dart';
import '../home_viewmodel.dart';

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
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 15.w),
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
              SizedBox(
                height: 5.h,
              ),
              Text(
                controller.product!.name,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  itemCount: controller.product!.name.split(" ").length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final String keyWord =
                        controller.product!.name.split(" ")[index];

                    return Container(
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                          color: AppColors.kewWordBackGroundColor,
                          borderRadius: BorderRadius.circular(8)),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                      child: Center(
                        child: Text(
                          keyWord,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.keyWordTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Discover & compare prices",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ListView.builder(
                  key: UniqueKey(),
                  shrinkWrap: true,
                  itemCount: controller.currentPrices.length,
                  itemBuilder: (context, index) {
                    final priceModel = controller.currentPrices[index];

                    return PriceCard(
                      index: index,
                      homeViewModel: controller,
                      priceModel: priceModel,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
