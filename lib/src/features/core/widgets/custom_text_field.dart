import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obsecureText = false,
  });

  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      style: TextStyle(color: AppColors.white),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.white),
        prefixIcon: Icon(prefixIcon, color: AppColors.white, size: 37.sp),
        suffixIcon: Icon(suffixIcon, color: AppColors.white, size: 30.sp),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
