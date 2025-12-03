import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  const CategoryItem({super.key, required this.isSelected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 14),
      height: 48.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellow : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.yellow, width: 2.w),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.black1 : AppColors.yellow,
          ),
        ),
      ),
    );
  }
}
