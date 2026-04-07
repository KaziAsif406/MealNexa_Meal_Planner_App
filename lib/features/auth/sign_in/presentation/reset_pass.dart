import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/widgets/reset_pass_form.dart';
import 'package:template_flutter/helpers/all_routes.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '/gen/colors.gen.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  void _handleResetPass() => Navigator.pushNamed(context, Routes.setPassword);

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
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c000000,
                  ),
                ),
              ),
              UIHelper.verticalSpace(40.h),
              // Form Section
              ResetPassForm(
                onConfirmReset: _handleResetPass,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
