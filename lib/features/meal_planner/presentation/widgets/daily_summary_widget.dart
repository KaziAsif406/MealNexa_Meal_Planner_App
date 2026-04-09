import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/colors.gen.dart';

class DailySummaryWidget extends StatelessWidget {
  final VoidCallback onCalendarTap;

  const DailySummaryWidget({
    super.key,
    required this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.c0B6552, AppColors.c22C55E],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Daily Summary',
                  style: TextFontStyle.textStyle20cFFFFFFOpenSans700,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(
                label: 'Total Calories',
                value: '700',
              ),
              _StatItem(
                label: 'Meals',
                value: '2/3',
              ),
              _StatItem(
                label: 'Target',
                value: '2,000',
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 8.h,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.cFFFFFF),
              backgroundColor: AppColors.cFFFFFF.withValues(alpha: 0.25),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextFontStyle.textStyle24cFFFFFFInter700,
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: TextFontStyle.textStyle12cFFFFFFOpenSans500,
        ),
      ],
    );
  }
}
