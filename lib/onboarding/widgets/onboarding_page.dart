import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/custom_button.dart';
import '../../gen/colors.gen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onButtonTap,
    this.showSkip = true,
    this.onSkip,
  });

  final String imageAsset;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onButtonTap;
  final bool showSkip;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(48.r),
                ),
                child: Image.asset(
                  imageAsset,
                  height: 450.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (showSkip && onSkip != null)
                Positioned(
                  right: 20.w,
                  top: 20.h,
                  child: TextButton(
                    onPressed: onSkip,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.c050505,
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('SKIP'),
                  ),
                ),
            ],
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c050505,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.6,
                    color: AppColors.c717171,
                  ),
                ),
                SizedBox(height: 36.h),
                CustomButton(
                  label: buttonLabel,
                  onPressed: onButtonTap,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
