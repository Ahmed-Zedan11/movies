import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';
import 'package:movies_app/src/features/core/models/movies_based_on_category_item.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<String> images = [
    AssestManger.avengers,
    AssestManger.badBoys,
    AssestManger.doctorStrange,
    AssestManger.movie1917,
    AssestManger.moviesPosters,
    AssestManger.oppenheimer,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 645.h,
              width: double.infinity,
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                      key: ValueKey(images[currentIndex]),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[currentIndex]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(color: Colors.black.withOpacity(0.7)),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: REdgeInsets.only(top: 7),
                        child: Image.asset(
                          AssestManger.availableNow,
                          width: 267.w,
                          height: 93.h,
                        ),
                      ),

                      SizedBox(height: 21.h),

                      CarouselSlider(
                        items: images.map((img) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                                child: Image.asset(
                                  img,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
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
                        }).toList(),

                        options: CarouselOptions(
                          height: 351.h,
                          viewportFraction: 0.6,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 600,
                          ),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.4,

                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 21.h),

                      Image.asset(
                        AssestManger.watchNow,
                        height: 146.h,
                        width: 354.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Action",
                    style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "See More",
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 310.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    MoviesBasedOnCategoryItem(image: images[index]),
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemCount: images.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
