import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/helpers/all_routes.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import 'widgets/sign_up_form.dart';
import '/gen/colors.gen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _handleSignUp() => debugPrint('Sign up tapped');

  void _handleSignIn() => Navigator.pushNamed(context, Routes.signInScreen);

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
              UIHelper.verticalSpace(50.h),
              // Header Section
              Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c000000,
                  ),
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Center(
                child: Text(
                  'Start your healthy eating journey today',
                  //  style: TextFontStyl,
                  // style: TextStyle(
                  //   fontSize: 14.sp,
                  //   fontWeight: FontWeight.w400,
                  //   color: const Color(0xFF999999),
                  // ),
                ),
              ),
              UIHelper.verticalSpace(40.h),
              // Form Section
              SignUpForm(
                onSignUp: _handleSignUp,
                onSignIn: _handleSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
