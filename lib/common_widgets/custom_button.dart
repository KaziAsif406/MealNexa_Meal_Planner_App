// lib/common_widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 52,
    this.borderRadius = 30,
    this.gradient,
    this.textStyle,
    this.padding,
    this.enabled = true,
    this.leading,
    this.trailing,
  });

  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final double borderRadius;
  final Gradient? gradient;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;

  static const Gradient _defaultGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.c05AD6E, AppColors.c2AA477],
  );

  @override
  Widget build(BuildContext context) {
    final buttonGradient = enabled ? (gradient ?? _defaultGradient) : null;
    final labelStyle = textStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        );

    return SizedBox(
      height: height.h,
      width: width?.w,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius.r),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(borderRadius.r),
          child: Ink(
            decoration: BoxDecoration(
              gradient: buttonGradient,
              color: enabled ? null : AppColors.cB5B5B5,
              borderRadius: BorderRadius.circular(borderRadius.r),
              boxShadow: enabled
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (leading != null) ...[
                    leading!,
                    SizedBox(width: 10.w),
                  ],
                  Text(label, style: labelStyle),
                  if (trailing != null) ...[
                    SizedBox(width: 10.w),
                    trailing!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
