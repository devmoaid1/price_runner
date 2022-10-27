import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:price_runner/core/constants/app_constats.dart';
import 'package:price_runner/core/constants/assets.dart';
import 'package:price_runner/core/constants/colors.dart';
import 'package:price_runner/core/utils/get_store_logo.dart';
import 'package:price_runner/data/models/price_model.dart';
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

class PriceCard extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final PriceModel priceModel;
  final int index;
  const PriceCard(
      {super.key,
      required this.homeViewModel,
      required this.priceModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.borderColor,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            getStoreLogo(priceModel),
                            width: 39.w,
                            height: 11.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(priceModel.storeName,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor)),
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset(priceModel.isAvailable
                          ? Assets.inStock
                          : Assets.outOfStock)
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(" ${priceModel.productPrice} EGP",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor)),
            ],
          ),
        ),
        index == homeViewModel.currentPrices.length - 1
            ? InkWell(
                onTap: () {
                  if (homeViewModel.isShowAll) {
                    homeViewModel.setShowAll();
                  } else {
                    homeViewModel.setShowLess();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      homeViewModel.isShowAll
                          ? "Show All Prices"
                          : "Show Less Prices",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                    Image.asset(
                      homeViewModel.isShowAll
                          ? Assets.arrowUp
                          : Assets.arrowDown,
                      width: 24.w,
                      height: 24.h,
                    ),

                    // Icon(
                    //   homeViewModel.isShowAll
                    //       ? Icons.arrow_downward
                    //       : Icons.arrow_drop_down,
                    //   color: Theme.of(context).primaryColor,
                    // )
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
