import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../helpers/all_routes.dart';
import 'widgets/sign_in_form.dart';
import '/gen/colors.gen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _handleSignIn() => debugPrint('Sign in tapped');

  void _handleForgotPassword() => Navigator.pushNamed(context, Routes.forgotPassScreen);

  void _handleSignUp() => Navigator.pushNamed(context, Routes.signUpScreen);

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
                  'Welcome Back',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c000000,
                  ),
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Center(
                child: Text(
                  'Login to continue your healthy journey',
                    style: TextFontStyle.textStyle14c1E1E1EOpenSans400,
                  // style: TextStyle(
                  //   fontFamily: 'Open Sans',
                  //   fontSize: 14.sp,
                  //   fontWeight: FontWeight.w400,
                  //   color: AppColors.c1E1E1E.withValues(alpha: 0.5),
                  // ),
                ),
              ),
              UIHelper.verticalSpace(40.h),
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
