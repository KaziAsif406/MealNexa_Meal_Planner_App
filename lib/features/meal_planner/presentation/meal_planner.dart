import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/colors.gen.dart';
import 'package:template_flutter/common_widgets/custom_button.dart';
import 'widgets/date_widget.dart';
import 'widgets/meal_time_widget.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  int _selectedDateIndex = 0;

  final List<Map<String, String>> _calendarDays = [
    {'day': 'Mon', 'date': '10'},
    {'day': 'Tue', 'date': '11'},
    {'day': 'Wed', 'date': '12'},
    {'day': 'Thu', 'date': '13'},
    {'day': 'Fri', 'date': '14'},
  ];

  void _openCalendar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Calendar tapped')),
    );
  }

  void _saveTarget() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Target calories saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF3FFF8,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Meal Planner',
                    style: TextFontStyle.textStyle24c0A0A0AInter700,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Plan your weekly meals',
                style: TextFontStyle.textStyle14c717182Inter400,
              ),
              SizedBox(height: 24.h),
              MealPlannerDateCard(
                selectedIndex: _selectedDateIndex,
                days: _calendarDays,
                onCalendarTap: _openCalendar,
                onDateSelected: (index) {
                  setState(() {
                    _selectedDateIndex = index;
                  });
                },
                onSaveTap: _saveTarget,
              ),
              SizedBox(height: 22.h),
              MealTimeWidget(
                title: 'Breakfast',
                mealTitle: 'Berry Smoothie Bowl',
                calories: '280 calories',
                actionLabel: 'Change',
                onActionTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Change Breakfast tapped')),
                  );
                },
              ),
              MealTimeWidget(
                title: 'Lunch',
                mealTitle: 'Colorful Buddha Bowl',
                calories: '420 calories',
                actionLabel: 'Change',
                onActionTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Change Lunch tapped')),
                  );
                },
              ),
              MealTimeWidget(
                title: 'Dinner',
                isEmpty: true,
                actionLabel: 'Add Dinner',
                onActionTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Add Dinner tapped')),
                  );
                },
              ),
              SizedBox(height: 24.h),
              CustomButton(
                label: 'Generate Grocery List',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Generate Grocery List tapped')),
                  );
                },
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
