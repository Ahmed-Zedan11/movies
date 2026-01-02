import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';
import 'package:movies_app/src/features/core/widgets/clickable_button.dart';
import 'package:movies_app/src/features/core/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Forget Password",
          style: GoogleFonts.roboto(color: AppColors.yellow, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset(AssestManger.forgorPasswordLogo),
            SizedBox(height: 24.h),
            CustomTextField(
              labelText: "Email",
              prefixIcon: Icons.email_rounded,
            ),
            SizedBox(height: 24.h),
            ClickableButton(
              title: "Verify Email",
              backgroundColor: AppColors.yellow,
              textColor: AppColors.black1,
              onPressed: _verifyEmail,
            ),
          ],
        ),
      ),
    );
  }

  void _verifyEmail() {}
}
