import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/common_widgets/custom_button.dart';
import '/common_widgets/custom_textform_field.dart';
import '/constants/validator.dart';
import '/gen/colors.gen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.onSignUp,
    this.onSignIn,
  });

  final VoidCallback onSignUp;
  final VoidCallback? onSignIn;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      widget.onSignUp();
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
            label: 'Name',
            hintText: 'Enter your name',
            controller: _nameController,
            keyboardType: TextInputType.name,
            validator: nameValidator,
          ),
          UIHelper.verticalSpace(14.h),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Enter your e-mail',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ),
          UIHelper.verticalSpace(14.h),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
            validator: passwordValidator,
          ),
          UIHelper.verticalSpace(14.h),
          CustomTextFormField(
            label: 'Confirm Password',
            hintText: 'Confirm your password',
            controller: _confirmPasswordController,
            obscureText: true,
            validator: (value) => confirmPasswordValidator(value, _passwordController.text),
          ),
          UIHelper.verticalSpace(28.h),
          CustomButton(
            label: 'Sign Up',
            onPressed: _isLoading ? null : _handleSignUp,
            width: double.infinity,
            height: 48.h,
          ),
          UIHelper.verticalSpace(80.h),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.c000000,
                ),
                children: [
                  TextSpan(
                    text: 'Sign In',
                   // style: TextFontStyle.t13c,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onSignIn,
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
