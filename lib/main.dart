import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/providers/onboarding/onboarding_provider.dart';
import 'package:movies_app/src/core/di/di.dart';
import 'package:movies_app/src/features/auth/presntation/cubit/auth_cubit.dart';
import 'package:movies_app/src/features/auth/presntation/screens/forget_password_screen.dart';
import 'package:movies_app/src/features/auth/presntation/screens/register_screen.dart';
import 'package:movies_app/src/config/resources/app_colors.dart';
import 'package:movies_app/src/features/main_layout/main_layout.dart';
import 'package:movies_app/src/features/onboarding_screen/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'src/core/routing/routes_manager.dart';
import 'src/features/splash/splash_screen.dart';
import 'src/features/auth/presntation/screens/login_screen.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnboardingProvider())],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => getIt<AuthCubit>())],
        child: const Movies(),
      ),
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
