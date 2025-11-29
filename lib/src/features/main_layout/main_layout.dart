import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';
import 'package:movies_app/src/features/main_layout/browse/browse.dart';
import 'package:movies_app/src/features/main_layout/home/home.dart';
import 'package:movies_app/src/features/main_layout/profile/profile.dart';
import 'package:movies_app/src/features/main_layout/search/search.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  List<Widget> tabs = [Home(), Search(), Browse(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 9),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    _currentIndex == 0 ? Icons.home_filled : Icons.home,
                    size: 24.sp,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 24.sp),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    _currentIndex == 2 ? Icons.explore : Icons.explore_outlined,
                    size: 24.sp,
                  ),
                  label: "Browse",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    _currentIndex == 3
                        ? Icons.person_2_rounded
                        : Icons.person_2_outlined,
                    size: 24.sp,
                  ),
                  label: "Profile",
                ),
              ],
              currentIndex: _currentIndex,
              backgroundColor: AppColors.black2,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedItemColor: AppColors.yellow,
              unselectedItemColor: AppColors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}
