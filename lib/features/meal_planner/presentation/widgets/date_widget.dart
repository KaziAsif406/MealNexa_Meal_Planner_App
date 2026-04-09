import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/colors.gen.dart';
import 'package:template_flutter/common_widgets/custom_textform_field.dart';
import 'package:template_flutter/common_widgets/custom_button.dart';
import 'daily_summary_widget.dart';

class MealPlannerDateCard extends StatefulWidget {
  final int selectedIndex;
  final List<Map<String, String>> days;
  final VoidCallback onCalendarTap;
  final VoidCallback onSaveTap;
  final ValueChanged<int> onDateSelected;

  const MealPlannerDateCard({
    super.key,
    required this.selectedIndex,
    required this.days,
    required this.onCalendarTap,
    required this.onSaveTap,
    required this.onDateSelected,
  });

  @override
  State<MealPlannerDateCard> createState() => _MealPlannerDateCardState();
}

class _MealPlannerDateCardState extends State<MealPlannerDateCard> {
  final TextEditingController _caloriesController = TextEditingController();

  @override
  void dispose() {
    _caloriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DailySummaryWidget(
          onCalendarTap: widget.onCalendarTap,
        ),
        SizedBox(height: 18.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: _caloriesController,
                hintText: 'Set your target calories',
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 12.w),
            CustomButton(
              label: 'Save',
              onPressed: widget.onSaveTap,
              height: 48.h,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 82.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.days.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final day = widget.days[index];
              final selected = index == widget.selectedIndex;
              return GestureDetector(
                onTap: () => widget.onDateSelected(index),
                child: Container(
                  width: 74.w,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.c0B6552 : AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      if (selected)
                        BoxShadow(
                          color: AppColors.c0B6552.withValues(alpha: 0.18),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day['day']!,
                        style: selected
                            ? TextFontStyle.textStyle14cFFFFFFOpenSans500
                            : TextFontStyle.textStyle14c0A0A0AInter500,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        day['date']!,
                        style: selected
                            ? TextFontStyle.textStyle18cFFFFFFOpenSans600
                            : TextFontStyle.textStyle14c717182Inter500,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
