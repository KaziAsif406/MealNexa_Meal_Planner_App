import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/sign_in_form.dart';
import '/gen/colors.gen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _handleSignIn() {
    // TODO: Implement sign in logic
    debugPrint('Sign in tapped');
  }

  void _handleForgotPassword() {
    // TODO: Navigate to forgot password screen
    debugPrint('Forgot password tapped');
  }

  void _handleSignUp() {
    // TODO: Navigate to sign up screen
    debugPrint('Sign up tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c000000,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Login to continue your healthy journey',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF999999),
                ),
              ),
              SizedBox(height: 40.h),
              // Form Section
              SignInForm(
                onSignIn: _handleSignIn,
                onForgotPassword: _handleForgotPassword,
                onSignUp: _handleSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
