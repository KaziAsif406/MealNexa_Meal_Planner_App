// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/common_widgets/custom_button.dart';
import '/common_widgets/custom_textform_field.dart';
import '/constants/validator.dart';
// import '/gen/colors.gen.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({
    super.key,
    required this.onResetCodeSent,
  });

  final VoidCallback onResetCodeSent;

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleResetCodeSent() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      widget.onResetCodeSent();
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
            label: '',
            hintText: 'Enter your e-mail',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ), 
          UIHelper.verticalSpace(28.h),
          CustomButton(
            label: 'Send Reset Code',
            onPressed: _isLoading ? null : _handleResetCodeSent,
            width: double.infinity,
            height: 48.h,
          ),
        ],
      ),
    );
  }
}
