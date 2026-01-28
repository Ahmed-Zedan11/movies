import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/config/resources/assest_manger.dart';
import 'package:movies_app/src/config/resources/ui_utills.dart';
import 'package:movies_app/src/core/routing/routes_manager.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';
import 'package:movies_app/src/core/widgets/clickable_button.dart';
import 'package:movies_app/src/core/widgets/clickable_text.dart';
import 'package:movies_app/src/core/widgets/custom_text_field.dart';
import 'package:movies_app/src/core/widgets/flutter_toaste.dart';
import 'package:movies_app/src/core/widgets/language_toggle_switch.dart';
import 'package:movies_app/src/config/resources/validator.dart';
import 'package:movies_app/src/features/auth/data/models/login_request.dart';
import 'package:movies_app/src/features/auth/presntation/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecure = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.all(68),
                child: Image.asset(AssestManger.loginLogo),
              ),
              CustomTextField(
                labelText: "Name",
                prefixIcon: Icons.perm_identity,
                controller: _nameController,
                //valiadtor is just temporary to avoid errors because of dummyJson password rules
                validator: (input) => Validator.validateLoginName(input),
              ),

              SizedBox(height: 22.h),

              CustomTextField(
                labelText: "Password",
                prefixIcon: Icons.lock,
                suffixIcon: _isSecure ? Icons.visibility_off : Icons.visibility,
                onSuffixIconPressed: _onSuffixIconPressed,
                obsecureText: _isSecure,
                controller: _passwordController,
                //valiadtor is just temporary to avoid errors because of dummyJson password rules
                validator: (input) => Validator.validateLoginPassword(input),
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
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoadingState) {
                    UiUtills.showLoading(context);
                  } else if (state is AuthErrorState) {
                    UiUtills.stopLoading(context);
                    CustomFlutterToast.flutterToast(
                      message: state.message,
                      color: AppColors.red,
                    );
                  } else if (state is LoginSuccessState) {
                    UiUtills.stopLoading(context);
                    CustomFlutterToast.flutterToast(
                      message: "Loged-In Succsefully",
                      color: AppColors.green,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.mainLayout,
                    );
                  }
                },
                child: ClickableButton(
                  title: "Login",
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.black1,
                  onPressed: _login,
                ),
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
    if (_formKey.currentState?.validate() == false) return;

    BlocProvider.of<AuthCubit>(context).login(
      LoginRequest(
        username: _nameController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _createOne() {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  void _loginWithGoogle() {}

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSuffixIconPressed() {
    _isSecure = !_isSecure;
    setState(() {});
  }
}
