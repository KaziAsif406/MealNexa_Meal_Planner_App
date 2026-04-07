import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import 'widgets/onboarding_dots.dart';
import 'widgets/onboarding_page.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageInfo> _pages = const [
    _OnboardingPageInfo(
      imageAsset: 'assets/images/onboarding_1.png',
      title: 'Discover Healthy Recipes',
      description:
          'Browse hundreds of nutritious recipes tailored to your dietary preferences and goals.',
      buttonLabel: 'Next',
    ),
    _OnboardingPageInfo(
      imageAsset: 'assets/images/onboarding_2.png',
      title: 'Plan Your Meal Easily',
      description:
          'Organize your weekly meals with a simple drag-and-drop calendar planner.',
      buttonLabel: 'Next',
    ),
    _OnboardingPageInfo(
      imageAsset: 'assets/images/onboarding_3.png',
      title: 'Auto Grocery List',
      description:
          'Generate smart shopping lists from your meal plans. Never forget an ingredient.',
      buttonLabel: 'Get Started',
    ),
  ];

  void _goToNextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed(Routes.signInScreen);
  }

  void _skipOnboarding() {
    _finishOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return OnboardingPage(
                  imageAsset: page.imageAsset,
                  title: page.title,
                  description: page.description,
                  showSkip: index < _pages.length - 1,
                  onSkip: _skipOnboarding,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: OnboardingDots(
              count: _pages.length,
              activeIndex: _currentPage,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: CustomButton(
              label: _pages[_currentPage].buttonLabel,
              onPressed: _goToNextPage,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPageInfo {
  const _OnboardingPageInfo({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.buttonLabel,
  });

  final String imageAsset;
  final String title;
  final String description;
  final String buttonLabel;
}
