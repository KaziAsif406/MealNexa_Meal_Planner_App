import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/common_widgets/custom_button.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/features/food_details/presentation/widgets/food_stat.dart';
import 'package:template_flutter/features/food_details/presentation/widgets/ingredient_tile.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/gen/colors.gen.dart';

class FoodDetails {
  const FoodDetails({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.time,
    required this.servings,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.ingredientSections,
    required this.instructions,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final String time;
  final String servings;
  final String calories;
  final String protein;
  final String carbs;
  final String fat;
  final List<IngredientSection> ingredientSections;
  final List<String> instructions;
}

class IngredientSection {
  const IngredientSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<IngredientItem> items;
}

class IngredientItem {
  const IngredientItem({
    required this.name,
    required this.quantity,
  });

  final String name;
  final String quantity;
}

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({
    super.key,
    required this.details,
  });

  final FoodDetails details;

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int _selectedTab = 0; // 0 for ingredients, 1 for instructions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        left: false,
        right: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      widget.details.title,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c000000,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      widget.details.subtitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8C8C8C),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoChip(
                          iconAsset: 'assets/icons/time_overlay.png',
                          title: 'Time',
                          value: widget.details.time,
                        ),
                        _buildInfoChip(
                          iconAsset: 'assets/icons/servings_overlay.png',
                          title: 'Servings',
                          value: widget.details.servings,
                        ),
                        _buildInfoChip(
                          iconAsset: 'assets/icons/calories_overlay.png',
                          title: 'Calories',
                          value: widget.details.calories,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: FoodStat(
                            value: widget.details.protein,
                            label: 'Protein',
                            backgroundColor: const Color(0xFFE6F8EF),
                            valueColor: const Color(0xFF1C7A4E),
                            textColor: const Color.fromARGB(255, 12, 250, 198),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: FoodStat(
                            value: widget.details.carbs,
                            label: 'Carbs',
                            backgroundColor: const Color(0xFFF1EDFF),
                            valueColor: const Color(0xFF7D4DFF),
                            textColor: const Color(0xFF7D4DFF),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: FoodStat(
                            value: widget.details.fat,
                            label: 'Fat',
                            backgroundColor: const Color(0xFFFFF2D7),
                            valueColor: const Color(0xFFD88B01),
                            textColor: const Color(0xFFD88B01),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    _buildToggleTabs(),
                    SizedBox(height: 24.h),
                    _selectedTab == 0 ? _buildIngredients() : _buildInstructions(),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        height: 48.h,
                        leading: Icon(
                          Icons.add,
                          size: 22.sp,
                          color: Colors.white,
                        ),
                        label: 'Add to Meal Plan',
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, Routes.navigationScreen);
                        },
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIngredients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.details.ingredientSections.map(
          (section) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c000000,
                ),
              ),
              SizedBox(height: 16.h),
              ...section.items.map(
                (item) => IngredientTile(
                  title: item.name,
                  quantity: item.quantity,
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.details.instructions.asMap().entries.map(
          (entry) {
            int index = entry.key + 1;
            String instruction = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C7A4E),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        instruction,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.c000000,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }


  Widget _buildHeader(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: 280.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.details.imagePath,
              height: 280.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 16.w,
            top: 16.h,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.c000000,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16.w,
            top: 16.h,
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_border,
                color: AppColors.c000000,
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({
    required String iconAsset,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          children: [
            Image.asset(
              iconAsset,
              width: 40.w,
              height: 40.w,
              fit: BoxFit.contain,
            ),
            UIHelper.horizontalSpace(5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.textStyle11c717182OpenSans400,
                  ),
                  Text(
                    value,
                    style: TextFontStyle.textStyle14c0A0A0AOpenSans600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTabs() {
    final ingredientCount = widget.details.ingredientSections
        .fold<int>(0, (total, section) => total + section.items.length);
    final instructionCount = widget.details.instructions.length;

    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: _selectedTab == 0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    'Ingredients ($ingredientCount)',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: _selectedTab == 0
                          ? AppColors.c000000
                          : const Color(0xFF8C8C8C),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: _selectedTab == 1 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    'Instructions ($instructionCount)',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: _selectedTab == 1
                          ? AppColors.c000000
                          : const Color(0xFF8C8C8C),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
