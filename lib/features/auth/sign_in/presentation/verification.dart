import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/common_widgets/custom_button.dart';
import 'package:template_flutter/helpers/all_routes.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/gen/colors.gen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _codeControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool _isVerifying = false;

  @override
  void dispose() {
    for (final controller in _codeControllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleVerify() {
    final isComplete =
        _codeControllers.every((controller) => controller.text.isNotEmpty);
    if (!isComplete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter the full verification code.')),
      );
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() {
        _isVerifying = false;
      });
      Navigator.pushNamed(context, Routes.setPassword);
    });
  }

  void _handleResend() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code resent.')),
    );
  }

  void _onCodeChanged(String value, int index) {
    if (value.isEmpty) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
      return;
    }

    if (index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
    }
  }

  Widget _buildCodeField(int index) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: TextFormField(
        controller: _codeControllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.c000000,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondaryColor.withValues(alpha: 0.1),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.secondaryColor.withValues(alpha: 0.1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.secondaryColor.withValues(alpha: 0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),
        onChanged: (value) => _onCodeChanged(value, index),
      ),
    );
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
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.c000000,
                  size: 24.sp,
                ),
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c000000,
                ),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Please confirm the security code received on your registered number.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.c000000.withOpacity(0.45),
                  height: 1.5,
                ),
              ),
              UIHelper.verticalSpace(40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_focusNodes.length, _buildCodeField),
              ),
              UIHelper.verticalSpace(36.h),
              CustomButton(
                label: _isVerifying ? 'Verifying...' : 'Verify',
                onPressed: _isVerifying ? null : _handleVerify,
                width: double.infinity,
                height: 48.h,
              ),
              UIHelper.verticalSpace(24.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Did not receive the code?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c000000.withOpacity(0.45),
                      ),
                    ),
                    TextButton(
                      onPressed: _handleResend,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.c4CAF50,
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Send Again'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
