import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';
import 'package:movies_app/src/features/core/models/movies_based_on_search_item.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      AssestManger.avengers,
      AssestManger.badBoys,
      AssestManger.doctorStrange,
      AssestManger.movie1917,
      AssestManger.moviesPosters,
      AssestManger.oppenheimer,
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  filled: true,
                  fillColor: AppColors.black2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                cursorColor: AppColors.white,
              ),
            ),
            SizedBox(height: 13.h),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.sp,
                    crossAxisSpacing: 16.sp,
                    childAspectRatio: 191.w / 279.h,
                  ),
                  itemBuilder: ((context, index) =>
                      MoviesBasedOnSearchItem(image: images[index])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
