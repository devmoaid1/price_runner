import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/get_store_logo.dart';
import '../../data/models/price_model.dart';
import '../home_viewmodel.dart';

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
