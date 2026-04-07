import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/colors.gen.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          width: isActive ? 24.w : 10.w,
          height: 10.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.c05AD6E : AppColors.cD6D6D6,
            borderRadius: BorderRadius.circular(10.r),
          ),
        );
      }),
    );
  }
}
