import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';
import 'package:movies_app/src/features/core/models/movies_based_on_category_item.dart';
import 'package:movies_app/src/features/core/models/movies_based_on_search_item.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
      body: Column(
        children: [
          Container(
            color: AppColors.grey,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 52.h),
                  Row(
                    children: [
                      Image.asset(
                        AssestManger.star,
                        width: 114.w,
                        height: 114.w,
                      ),
                      SizedBox(width: 46.w),
                      Column(
                        children: [
                          SizedBox(height: 34.h),
                          Text(
                            "12",
                            style: GoogleFonts.roboto(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Watch List",
                            style: GoogleFonts.roboto(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 38.w),
                      Column(
                        children: [
                          SizedBox(height: 34.h),
                          Text(
                            "10",
                            style: GoogleFonts.roboto(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "History",
                            style: GoogleFonts.roboto(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Ahmed Zedan",
                    style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 23.h),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _onEditProfilePressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: REdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 15,
                          ),
                          child: Text(
                            "Edit Profile",
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      ElevatedButton(
                        onPressed: _onEditProfilePressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Exit",
                                style: GoogleFonts.roboto(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Icon(Icons.exit_to_app, color: AppColors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  DefaultTabController(
                    length: 2,
                    child: SizedBox(
                      height: 70.h,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: AppColors.yellow,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.list,
                                  size: 19.sp,
                                  color: AppColors.yellow,
                                ),
                                Text(
                                  "Watch List",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.folder,
                                  size: 19.sp,
                                  color: AppColors.yellow,
                                ),
                                Text(
                                  "History",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.sp,
                crossAxisSpacing: 16.sp,
                childAspectRatio: 122.w / 180.h,
              ),
              itemBuilder: ((context, index) =>
                  MoviesBasedOnSearchItem(image: images[index])),
            ),
          ),
        ],
      ),
    );
  }
}

_onEditProfilePressed() {}
