import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/widgets/forgot_pass_form.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../helpers/all_routes.dart';
import 'widgets/sign_in_form.dart';
import '/gen/colors.gen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  void _handleSendResetCode() => debugPrint('Send reset code tapped');

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
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              ),
              UIHelper.verticalSpace(50.h),
              // Header Section
              Text(
                'Enter E-mail',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c000000,
                ),
              ),
              UIHelper.verticalSpace(40.h),
              // Form Section
              ForgotPassForm(
                onResetCodeSent: _handleSendResetCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
