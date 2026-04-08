import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/colors.gen.dart';
import 'package:template_flutter/common_widgets/custom_button.dart';
import 'package:template_flutter/helpers/all_routes.dart';
import 'widgets/preference_selector.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final Set<String> _selectedDietaryPreferences = {};
  final Set<String> _selectedCuisineInterests = {};
  final Set<String> _selectedAllergies = {};

  void _toggleDietaryPreference(String preference) {
    setState(() {
      if (_selectedDietaryPreferences.contains(preference)) {
        _selectedDietaryPreferences.remove(preference);
      } else {
        _selectedDietaryPreferences.add(preference);
      }
    });
  }

  void _toggleCuisineInterest(String cuisine) {
    setState(() {
      if (_selectedCuisineInterests.contains(cuisine)) {
        _selectedCuisineInterests.remove(cuisine);
      } else {
        _selectedCuisineInterests.add(cuisine);
      }
    });
  }

  void _toggleAllergy(String allergy) {
    setState(() {
      if (_selectedAllergies.contains(allergy)) {
        _selectedAllergies.remove(allergy);
      } else {
        _selectedAllergies.add(allergy);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.c0A0A0A,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
            // Title and Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your Preferences',
                    style: TextFontStyle.textStyle24c1E1E1EOpenSans600
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Help us personalize your experience',
                    style: TextFontStyle.textStyle14c1E1E1EOpenSans400
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dietary Preferences Section
                    Text(
                      'Dietary Preferences',
                      style: TextFontStyle.textStyle18c1E1E1EOpenSans600,
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: [
                        PreferenceSelector(
                          label: 'Vegan',
                          isSelected: _selectedDietaryPreferences.contains('Vegan'),
                          onTap: () => _toggleDietaryPreference('Vegan'),
                        ),
                        PreferenceSelector(
                          label: 'Vegetarian',
                          isSelected: _selectedDietaryPreferences.contains('Vegetarian'),
                          onTap: () => _toggleDietaryPreference('Vegetarian'),
                        ),
                        PreferenceSelector(
                          label: 'Keto',
                          isSelected: _selectedDietaryPreferences.contains('Keto'),
                          onTap: () => _toggleDietaryPreference('Keto'),
                        ),
                        PreferenceSelector(
                          label: 'High Protein',
                          isSelected: _selectedDietaryPreferences.contains('High Protein'),
                          onTap: () => _toggleDietaryPreference('High Protein'),
                        ),
                        PreferenceSelector(
                          label: 'Gluten free',
                          isSelected: _selectedDietaryPreferences.contains('Gluten free'),
                          onTap: () => _toggleDietaryPreference('Gluten free'),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    // Cuisine Interests Section
                    Text(
                      'Cuisine Interests',
                      style: TextFontStyle.textStyle18c1E1E1EOpenSans600,
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: [
                        PreferenceSelector(
                          label: 'Italian',
                          isSelected: _selectedCuisineInterests.contains('Italian'),
                          onTap: () => _toggleCuisineInterest('Italian'),
                        ),
                        PreferenceSelector(
                          label: 'Mexican',
                          isSelected: _selectedCuisineInterests.contains('Mexican'),
                          onTap: () => _toggleCuisineInterest('Mexican'),
                        ),
                        PreferenceSelector(
                          label: 'Asian',
                          isSelected: _selectedCuisineInterests.contains('Asian'),
                          onTap: () => _toggleCuisineInterest('Asian'),
                        ),
                        PreferenceSelector(
                          label: 'Mediterranean',
                          isSelected: _selectedCuisineInterests.contains('Mediterranean'),
                          onTap: () => _toggleCuisineInterest('Mediterranean'),
                        ),
                        PreferenceSelector(
                          label: 'Indian',
                          isSelected: _selectedCuisineInterests.contains('Indian'),
                          onTap: () => _toggleCuisineInterest('Indian'),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    // Allergies Section
                    Text(
                      'Allergies',
                      style: TextFontStyle.textStyle18c1E1E1EOpenSans600,
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: [
                        PreferenceSelector(
                          label: 'Nuts',
                          isSelected: _selectedAllergies.contains('Nuts'),
                          onTap: () => _toggleAllergy('Nuts'),
                        ),
                        PreferenceSelector(
                          label: 'Dairy',
                          isSelected: _selectedAllergies.contains('Dairy'),
                          onTap: () => _toggleAllergy('Dairy'),
                        ),
                        PreferenceSelector(
                          label: 'Eggs',
                          isSelected: _selectedAllergies.contains('Eggs'),
                          onTap: () => _toggleAllergy('Eggs'),
                        ),
                        PreferenceSelector(
                          label: 'Shellfish',
                          isSelected: _selectedAllergies.contains('Shellfish'),
                          onTap: () => _toggleAllergy('Shellfish'),
                        ),
                        PreferenceSelector(
                          label: 'Soy',
                          isSelected: _selectedAllergies.contains('Soy'),
                          onTap: () => _toggleAllergy('Soy'),
                        ),
                        PreferenceSelector(
                          label: 'Gluten',
                          isSelected: _selectedAllergies.contains('Gluten'),
                          onTap: () => _toggleAllergy('Gluten'),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            // Continue Button
            Padding(
              padding: EdgeInsets.all(24.w),
              child: CustomButton(
                label: 'Continue',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.navigationScreen);
                },
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
