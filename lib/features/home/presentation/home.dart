import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/common_widgets/custom_button.dart';
import '/common_widgets/custom_textform_field.dart';
import '/gen/colors.gen.dart';
import 'widgets/catagory.dart';
import 'widgets/meals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 1;

  final List<Map<String, String>> _categories = [
    {
      'label': 'Breakfast',
      'image': 'assets/images/breakfast.png',
    },
    {
      'label': 'Lunch',
      'image': 'assets/images/Lunch.png',
    },
    {
      'label': 'Dinner',
      'image': 'assets/images/Dinner.png',
    },
    {
      'label': 'Brunch',
      'image': 'assets/images/brunch.png',
    },
  ];

  final List<Map<String, String>> _meals = [
    {
      'title': 'Avocado Toast Delight',
      'image': 'assets/images/home_1.png',
      'calories': '320 cal',
      'time': '15 min',
    },
    {
      'title': 'Colorful Buddha Bowl',
      'image': 'assets/images/home_2.png',
      'calories': '320 cal',
      'time': '15 min',
    },
    {
      'title': 'Spicy Veggie Salad',
      'image': 'assets/images/home_3.png',
      'calories': '280 cal',
      'time': '12 min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 24.h,
            bottom: 110.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c000000,
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),
                        Text(
                          'What would you like to cook today?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8A8A8A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 52.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      size: 26.sp,
                      color: AppColors.c000000,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(24.h),
              CustomTextFormField(
                label: null,
                hintText: 'Search recipes or meals',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  child: Icon(
                    Icons.search,
                    color: AppColors.c000000.withValues(alpha: 0.5),
                    size: 25.sp,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0.w, vertical: 18.h),
              ),
              UIHelper.verticalSpace(24.h),
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => UIHelper.horizontalSpace(14.w),
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return CategoryCard(
                      label: category['label']!,
                      imagePath: category['image']!,
                      selected: _selectedCategory == index,
                      onTap: () {
                        setState(() {
                          _selectedCategory = index;
                        });
                      },
                    );
                  },
                ),
              ),
              UIHelper.verticalSpace(28.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home_view_plan_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.all(22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(18.h),
                    Text(
                      'Healthy Weekly Plan',
                      style: TextFontStyle.textStyle20cFFFFFFOpenSans700,
                    ),
                    UIHelper.verticalSpace(8.h),
                    Text(
                      '7 day meal plan for a healthier you',
                      style: TextFontStyle.textStyle14cFFFFFFOpenSans400,
                    ),
                    UIHelper.verticalSpace(18.h),
                    CustomButton(
                      label: 'View Plan',
                      onPressed: () {},
                      width: 112.w,
                      height: 40.h,
                      borderRadius: 5000.r,
                      gradient: const LinearGradient(
                        colors: [AppColors.cFFFFFF, AppColors.cFFFFFF],
                      ),
                      textStyle: TextStyle(
                        color: AppColors.c05AD6E,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(29.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _meals.map((meal) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: MealCard(
                      title: meal['title']!,
                      imagePath: meal['image']!,
                      calories: meal['calories']!,
                      duration: meal['time']!,
                      isFavorite: false,
                      onFavoriteTap: () {},
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
