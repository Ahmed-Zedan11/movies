import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obsecureText = false,
    required this.controller,
    required this.validator,
    this.onSuffixIconPressed,
  });

  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obsecureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final VoidCallback? onSuffixIconPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obsecureText,
      style: TextStyle(color: AppColors.white),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        errorMaxLines: 3,
        filled: true,
        fillColor: AppColors.grey,
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.white),
        prefixIcon: Icon(prefixIcon, color: AppColors.white, size: 37.sp),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          color: AppColors.white,
          iconSize: 30.sp,
          onPressed: onSuffixIconPressed,
        ),

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
