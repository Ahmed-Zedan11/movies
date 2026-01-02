import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/providers/onboarding/onboarding_provider.dart';
import 'package:movies_app/src/features/auth/forget_password/forget_password_screen.dart';
import 'package:movies_app/src/features/auth/register/register_screen.dart';
import 'package:movies_app/src/features/core/theme/app_colors.dart';
import 'package:movies_app/src/features/main_layout/main_layout.dart';
import 'package:movies_app/src/features/onboarding_screen/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'src/features/core/routing/routes_manager.dart';
import 'src/features/splash/splash_screen.dart';
import 'src/features/auth/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnboardingProvider())],
      child: const Movies(),
    ),
  );
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          routes: {
            AppRoutes.splash: (_) => const SplashScreen(),
            AppRoutes.login: (_) => const LoginScreen(),
            AppRoutes.onboarding: (_) => const OnboardingScreen(),
            AppRoutes.mainLayout: (_) => const MainLayout(),
            AppRoutes.register: (_) => const RegisterScreen(),
            AppRoutes.forgetPassword: (_) => const ForgetPasswordScreen(),
          },
          theme: ThemeData(scaffoldBackgroundColor: AppColors.black1),
        );
      },
    );
  }
}
