import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/colors.gen.dart';

class MealTimeWidget extends StatelessWidget {
  final String title;
  final String? mealTitle;
  final String? calories;
  final String actionLabel;
  final bool isEmpty;
  final VoidCallback onActionTap;

  const MealTimeWidget({
    super.key,
    required this.title,
    this.mealTitle,
    this.calories,
    required this.actionLabel,
    this.isEmpty = false,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.c000000.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextFontStyle.textStyle18c0A0A0AOpenSans600,
          ),
          SizedBox(height: 16.h),
          isEmpty ? _buildEmptyCard(context) : _buildMealCard(context),
        ],
      ),
    );
  }

  Widget _buildMealCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealTitle ?? '',
                style: TextFontStyle.textStyle18c1E1E1EOpenSans600,
              ),
              SizedBox(height: 8.h),
              Text(
                calories ?? '',
                style: TextFontStyle.textStyle14c717182Inter400,
              ),
            ],
          ),
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionLabel,
              style: TextFontStyle.textStyle14c22C55EOpenSans500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCard(BuildContext context) {
    return GestureDetector(
      onTap: onActionTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.cD9D9D9, width: 1.3.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 28.sp,
              color: AppColors.c22C55E,
            ),
            SizedBox(height: 12.h),
            Text(
              actionLabel,
              style: TextFontStyle.textStyle14c22C55EOpenSans500,
            ),
          ],
        ),
      ),
    );
  }
}
