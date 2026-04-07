// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/common_widgets/custom_button.dart';
import '/common_widgets/custom_textform_field.dart';
import '/constants/validator.dart';
// import '/gen/colors.gen.dart';

class ResetPassForm extends StatefulWidget {
  const ResetPassForm({
    super.key,
    required this.onConfirmReset,
  });

  final VoidCallback onConfirmReset;

  @override
  State<ResetPassForm> createState() => _ResetPassFormState();
}

class _ResetPassFormState extends State<ResetPassForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleConfirmReset() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      widget.onConfirmReset();
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
            label: 'Confirm',
            onPressed: _isLoading ? null : _handleConfirmReset,
            width: double.infinity,
            height: 48.h,
          ),
        ],
      ),
    );
  }
}
