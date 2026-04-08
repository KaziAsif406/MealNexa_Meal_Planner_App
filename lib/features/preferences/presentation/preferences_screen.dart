import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common_widgets/custom_button.dart';
import '/gen/colors.gen.dart';
import 'widgets/preference_selector.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final Set<String> _dietaryPreferences = {};
  final Set<String> _cuisineInterests = {};
  final Set<String> _allergies = {};

  static const List<String> _dietaryOptions = [
    'Vegan',
    'Vegetarian',
    'Keto',
    'High Protein',
    'Gluten Free',
  ];

  static const List<String> _cuisineOptions = [
    'Italian',
    'Mexican',
    'Asian',
    'Mediterranean',
    'Indian',
  ];

  static const List<String> _allergyOptions = [
    'Nuts',
    'Dairy',
    'Eggs',
    'Shellfish',
    'Soy',
    'Gluten',
  ];

  void _toggleSelection(Set<String> selectedSet, String value) {
    setState(() {
      if (selectedSet.contains(value)) {
        selectedSet.remove(value);
      } else {
        selectedSet.add(value);
      }
    });
  }

  Widget _buildSection(String title, List<String> items, Set<String> selectedSet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.c000000,
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: items.map((item) {
            final bool selected = selectedSet.contains(item);
            return PreferenceSelector(
              label: item,
              selected: selected,
              onTap: () => _toggleSelection(selectedSet, item),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                    color: AppColors.c000000,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your Preferences',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c000000,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Help us personalize your experience',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8B8B8B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34.h),
              _buildSection('Dietary Preferences', _dietaryOptions, _dietaryPreferences),
              SizedBox(height: 28.h),
              _buildSection('Cuisine Interests', _cuisineOptions, _cuisineInterests),
              SizedBox(height: 28.h),
              _buildSection('Allergies', _allergyOptions, _allergies),
              const Spacer(),
              CustomButton(
                label: 'Continue',
                onPressed: () {
                  // TODO: handle continue action
                  debugPrint('Continue tapped');
                },
                width: double.infinity,
                height: 56.h,
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
