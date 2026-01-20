import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/config/resources/assest_manger.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';

class MoviesBasedOnSearchItem extends StatelessWidget {
  final String image;

  const MoviesBasedOnSearchItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            width: 191.w,
            height: 279.h,
          ),
        ),
        Positioned(
          top: 11.h,
          left: 9.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.black2.withOpacity(0.7),
            ),
            child: Padding(
              padding: REdgeInsets.all(7.0),
              child: Row(
                children: [
                  Text(
                    "7.7 ",
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  Image.asset(AssestManger.star),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
