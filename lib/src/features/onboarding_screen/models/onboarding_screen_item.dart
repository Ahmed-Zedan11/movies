import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';
import 'package:movies_app/src/features/core/widgets/clickable_button.dart';
import 'package:movies_app/src/features/onboarding_screen/models/onboarding_data.dart';

class OnboardingScreenItem extends StatelessWidget {
  final OnboardingData data;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;

  const OnboardingScreenItem({
    super.key,
    required this.data,
    required this.onNextPressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(data.imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          data.isFirst
              ? Container(
                  width: double.infinity,
                  color: AppColors.black2.withOpacity(0.6),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        data.title,
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        textAlign: TextAlign.center,
                        data.description!,
                        style: GoogleFonts.inter(
                          color: AppColors.white.withOpacity(0.6),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ClickableButton(
                        title: "Explore Now",
                        backgroundColor: AppColors.yellow,
                        textColor: AppColors.black1,
                        onPressed: onNextPressed,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                )
              : Container(
                  padding: REdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40.r),
                    ),
                    color: AppColors.black1,
                  ),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        data.title,
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        textAlign: TextAlign.center,
                        data.description ?? "",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ClickableButton(
                        title: data.isLast ? "Finish" : "Next",
                        backgroundColor: AppColors.yellow,
                        textColor: AppColors.black1,
                        onPressed: onNextPressed,
                      ),
                      SizedBox(height: 16.h),
                      data.isSecond
                          ? SizedBox.shrink()
                          : OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(365.w, 55.h),
                                side: BorderSide(color: AppColors.yellow),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                              onPressed: onBackPressed,
                              child: Text(
                                "Back",
                                style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.yellow,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
