import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';
import 'package:movies_app/src/features/core/routing/routes_manager.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';
import 'package:movies_app/src/features/core/widgets/clickable_button.dart';
import 'package:movies_app/src/features/core/widgets/clickable_text.dart';
import 'package:movies_app/src/features/core/widgets/custom_text_field.dart';
import 'package:movies_app/src/features/core/widgets/language_toggle_switch.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> profilePictures = [
      AssestManger.profilePicture,
      AssestManger.profilePicture2,
      AssestManger.profilePicture3,
    ];

    return Scaffold(
      backgroundColor: AppColors.black1,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.black1,
        foregroundColor: AppColors.yellow,
        title: Text("Register", style: GoogleFonts.roboto(fontSize: 16.sp)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CarouselSlider(
              items: profilePictures.map((img) => Image.asset(img)).toList(),
              options: CarouselOptions(
                height: 161.h,
                viewportFraction: 0.4,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Avatar",
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 12.h),
            CustomTextField(labelText: "Name", prefixIcon: Icons.perm_identity),
            SizedBox(height: 24.h),
            CustomTextField(
              labelText: "Email",
              prefixIcon: Icons.email_rounded,
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              labelText: "Password",
              prefixIcon: Icons.lock,
              obsecureText: true,
              suffixIcon: Icons.visibility_off_rounded,
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              labelText: "Confirm Password",
              prefixIcon: Icons.lock,
              obsecureText: true,
              suffixIcon: Icons.visibility_off_rounded,
            ),
            SizedBox(height: 24.h),
            CustomTextField(labelText: "Phone Number", prefixIcon: Icons.phone),
            SizedBox(height: 24.h),
            ClickableButton(
              title: "Create Account",
              backgroundColor: AppColors.yellow,
              textColor: AppColors.black1,
              onPressed: _createAcoount,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                ClickableText(onTap: _login, text: "Login"),
              ],
            ),
            SizedBox(height: 18.h),
            LanguageToggleSwitch(),
          ],
        ),
      ),
    );
  }

  void _createAcoount() {}

  void _login() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}
