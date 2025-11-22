import 'package:flutter/material.dart';
import 'package:movies_app/providers/onboarding/onboarding_provider.dart';
import 'package:movies_app/src/features/core/routing/routes_manager.dart';
import 'package:movies_app/src/features/onboarding_screen/models/onboarding_data.dart';
import 'package:movies_app/src/features/onboarding_screen/models/onboarding_screen_item.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  void _goNext() async {
    OnboardingProvider onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    final currentPage = _pageController.page?.toInt() ?? 0;

    if (currentPage < OnboardingData.onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await onboardingProvider.setOnboardingSeen();
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  void _goBack() {
    final currentPage = _pageController.page?.toInt() ?? 0;

    if (currentPage > 1) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: OnboardingData.onboardingPages.length,
        itemBuilder: (context, index) {
          return OnboardingScreenItem(
            onBackPressed: _goBack,
            onNextPressed: _goNext,
            data: OnboardingData.onboardingPages[index],
          );
        },
      ),
    );
  }
}
