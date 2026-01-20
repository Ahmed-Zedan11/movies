import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/src/config/resources/assest_manger.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';
import 'package:movies_app/src/core/widgets/clickable_button.dart';
import 'package:movies_app/src/core/widgets/custom_text_field.dart';
import 'package:movies_app/src/config/resources/validator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController _emailController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(AssestManger.forgorPasswordLogo),
              SizedBox(height: 24.h),
              CustomTextField(
                labelText: "Email",
                prefixIcon: Icons.email_rounded,
                controller: _emailController,
                validator: (input) => Validator.validateEmail(input),
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
      ),
    );
  }

  void _verifyEmail() {
    if (_formKey.currentState?.validate() == false) return;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
