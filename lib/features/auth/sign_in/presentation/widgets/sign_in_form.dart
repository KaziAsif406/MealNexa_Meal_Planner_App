import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/common_widgets/custom_button.dart';
import '/common_widgets/custom_textform_field.dart';
import '/constants/validator.dart';
import '/gen/colors.gen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.onSignIn,
    this.onForgotPassword,
    this.onSignUp,
  });

  final VoidCallback onSignIn;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onSignUp;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      widget.onSignIn();
      // Add a small delay to show the button state change
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFormField(
            label: 'Email',
            hintText: 'Enter your e-mail',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ),
          UIHelper.verticalSpace(24.h),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
            validator: passwordValidator,
          ),
          UIHelper.verticalSpace(12.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: widget.onForgotPassword,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                  decorationColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          UIHelper.verticalSpace(28.h),
          CustomButton(
            label: 'Sign In',
            onPressed: _isLoading ? null : _handleSignIn,
            width: double.infinity,
            height: 48.h,
          ),
          UIHelper.verticalSpace(250.h),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.c000000,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                   // style: TextFontStyle.t13c,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onSignUp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
