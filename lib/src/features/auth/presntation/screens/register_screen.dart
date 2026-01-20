import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/config/resources/ui_utills.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/presntation/cubit/auth_cubit.dart';
import 'package:movies_app/src/core/widgets/flutter_toaste.dart';
import 'package:movies_app/src/config/resources/assest_manger.dart';
import 'package:movies_app/src/core/routing/routes_manager.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';
import 'package:movies_app/src/core/widgets/clickable_button.dart';
import 'package:movies_app/src/core/widgets/clickable_text.dart';
import 'package:movies_app/src/core/widgets/custom_text_field.dart';
import 'package:movies_app/src/core/widgets/language_toggle_switch.dart';
import 'package:movies_app/src/config/resources/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  late TextEditingController _phoneNumberController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordIsSecure = true;
  bool _rePasswordIsSecure = true;
  int _currentImageIndex = 0;
  List<String> profilePictures = [
    AssestManger.profilePicture,
    AssestManger.profilePicture2,
    AssestManger.profilePicture3,
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CarouselSlider(
                  items: profilePictures
                      .map((img) => Image.asset(img))
                      .toList(),
                  options: CarouselOptions(
                    height: 161.h,
                    viewportFraction: 0.4,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) => setState(() {
                      _currentImageIndex = index;
                    }),
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
                CustomTextField(
                  labelText: "Name",
                  prefixIcon: Icons.perm_identity,
                  controller: _nameController,
                  validator: (input) => Validator.validateName(input),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  labelText: "Email",
                  prefixIcon: Icons.email_rounded,
                  controller: _emailController,
                  validator: (input) => Validator.validateEmail(input),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  labelText: "Password",
                  prefixIcon: Icons.lock,
                  obsecureText: _passwordIsSecure,
                  suffixIcon: _passwordIsSecure
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  onSuffixIconPressed: _onSuffixIconPressed,
                  controller: _passwordController,
                  validator: (input) => Validator.validatePassword(input),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  labelText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  obsecureText: _rePasswordIsSecure,
                  suffixIcon: _rePasswordIsSecure
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  onSuffixIconPressed: _onSuffixIconPressedForRePassword,
                  controller: _rePasswordController,
                  validator: (input) => Validator.validateRePassword(
                    input,
                    _passwordController.text,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  labelText: "Phone Number",
                  prefixIcon: Icons.phone,
                  controller: _phoneNumberController,
                  validator: (input) => Validator.validatePhoneNumber(input),
                ),
                SizedBox(height: 24.h),
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
                    } else if (state is AuthSuccessState) {
                      UiUtills.stopLoading(context);
                      CustomFlutterToast.flutterToast(
                        message: "Registred Succsefully",
                        color: AppColors.green,
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    }
                  },
                  child: ClickableButton(
                    title: "Create Account",
                    backgroundColor: AppColors.yellow,
                    textColor: AppColors.black1,
                    onPressed: _createAcoount,
                  ),
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
        ),
      ),
    );
  }

  void _createAcoount() {
    if (_formKey.currentState?.validate() == false) return;
    final selectedImage = profilePictures[_currentImageIndex];
    BlocProvider.of<AuthCubit>(context).register(
      RegisterRequest(
        email: _emailController.text,
        username: _nameController.text,
        password: _passwordController.text,
        image: selectedImage,
      ),
    );
    
  }

  void _login() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _onSuffixIconPressed() {
    _passwordIsSecure = !_passwordIsSecure;
    setState(() {});
  }

  void _onSuffixIconPressedForRePassword() {
    _rePasswordIsSecure = !_rePasswordIsSecure;
    setState(() {});
  }
}
