import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/widgets/forgot_pass_form.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
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
                onPressed: () => Navigator.of(context).pop(),
                // padding: EdgeInsets.zero,
                // constraints: BoxConstraints(
                //   minWidth: 0,
                //   minHeight: 0,
                // ),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.c000000,
                  size: 24.sp,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              // Header Section
              Text(
                'Enter E-mail',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c000000,
                ),
              ),
              UIHelper.verticalSpace(10.h),
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
