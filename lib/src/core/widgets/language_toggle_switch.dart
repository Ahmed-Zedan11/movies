import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/config/resources/assest_manger.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';

class LanguageToggleSwitch extends StatelessWidget {
  const LanguageToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<String>.size(
      current: "en",
      values: ["en", "ar"],
      height: 40.h,
      spacing: 26.w,
      indicatorSize: Size(43.w, 40.h),
      animationDuration: const Duration(milliseconds: 300),
      style: ToggleStyle(
        indicatorColor: Colors.transparent,
        indicatorBorder: BoxBorder.all(color: AppColors.yellow, width: 3.w),
        backgroundColor: Colors.transparent,
        borderColor: AppColors.yellow,
        borderRadius: BorderRadius.circular(30.r),
      ),
      iconBuilder: (value) {
        return Image.asset(
          value == 'en'
              ? AssestManger.enLocalization
              : AssestManger.arLocalization,
          width: 27.w,
          height: 27.h,
        );
      },
    );
  }
}
