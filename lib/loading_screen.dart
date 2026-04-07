import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helpers/all_routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(Routes.onboardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.transparent),
        child: Scaffold(
          body: Center(
            child: Image.asset(
              'assets/icons/logo.png',
              width: 150.w,
              height: 150.h,
            ),
          ),
        ),
      ),
    );
  }
}
