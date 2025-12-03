import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';
import 'package:movies_app/src/features/core/models/category_item.dart';
import 'package:movies_app/src/features/core/models/category_model.dart';
import 'package:movies_app/src/features/core/models/movies_based_on_search_item.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  int selectedIndex = 0;
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
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              DefaultTabController(
                length: 8,
                child: TabBar(
                  labelPadding: REdgeInsets.only(right: 8),
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: AppColors.yellow,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black1,
                  ),
                  tabs: CategoryModel.categories
                      .map(
                        (category) => CategoryItem(
                          isSelected:
                              selectedIndex ==
                              CategoryModel.categories.indexOf(category),
                          name: category.name,
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 25.h),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}
