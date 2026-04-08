import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
// import '/gen/colors.gen.dart';
import 'package:template_flutter/constants/text_font_style.dart';

class FoodStat extends StatelessWidget {
  const FoodStat({
    super.key,
    required this.value,
    required this.label,
    required this.textColor,
    required this.backgroundColor,
    required this.valueColor,
  });

  final String value;
  final String label;
  final Color backgroundColor;
  final Color valueColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextFontStyle.textStyle18c0B6552OpenSans700.copyWith(color: valueColor),
          ),
          UIHelper.verticalSpace(6.h),
          Text(
            label,
            style: TextFontStyle.textStyle11c717182OpenSans400,
          ),
        ],
      ),
    );
  }
}
