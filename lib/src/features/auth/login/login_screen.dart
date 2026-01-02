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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.all(68),
                child: Image.asset(AssestManger.loginLogo),
              ),
              CustomTextField(
                labelText: "Email",
                prefixIcon: Icons.email_rounded,
              ),

              SizedBox(height: 22.h),

              CustomTextField(
                labelText: "Password",
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_off,
                obsecureText: true,
              ),

              SizedBox(height: 17.h),
              Align(
                alignment: Alignment.centerRight,
                child: ClickableText(
                  onTap: _forgotPassword,
                  text: "Forgot Password ?",
                ),
              ),
              SizedBox(height: 33.h),
              ClickableButton(
                title: "Login",
                backgroundColor: AppColors.yellow,
                textColor: AppColors.black1,
                onPressed: _login,
              ),
              SizedBox(height: 23.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account ?",
                    style: GoogleFonts.roboto(
                      color: AppColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ClickableText(onTap: _createOne, text: "Create One"),
                ],
              ),
              SizedBox(height: 27.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.yellow,
                      thickness: 1.h,
                      indent: 80.w,
                      endIndent: 10.w,
                    ),
                  ),
                  Text(
                    "OR",
                    style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      color: AppColors.yellow,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.yellow,
                      thickness: 1.h,
                      indent: 10.w,
                      endIndent: 80.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              ElevatedButton(
                onPressed: _loginWithGoogle,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  backgroundColor: AppColors.yellow,
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssestManger.googleLogo,
                        width: 27.w,
                        height: 27.h,
                        color: AppColors.black1,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        "Login with Google",
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          color: AppColors.black1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 33.h),
              LanguageToggleSwitch(),
            ],
          ),
        ),
      ),
    );
  }

  void _forgotPassword() {
    Navigator.pushNamed(context, AppRoutes.forgetPassword);
  }

  void _login() {
    Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
  }

  void _createOne() {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  void _loginWithGoogle() {}
}
