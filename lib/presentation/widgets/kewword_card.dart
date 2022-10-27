import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';

class KewWordCard extends StatelessWidget {
  const KewWordCard({
    Key? key,
    required this.keyWord,
  }) : super(key: key);

  final String keyWord;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
          color: AppColors.kewWordBackGroundColor,
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
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
  }
}
