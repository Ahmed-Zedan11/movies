import 'package:flutter/material.dart';
import 'package:movies_app/src/features/core/cach_constant/cach_constatnt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isSeen = false;
  bool get isSeen => _isSeen;

  Future<void> loadOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSeen = prefs.getBool(CachConstatnt.onboardingSeen) ?? false;
    notifyListeners();
  }

  Future<void> setOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(CachConstatnt.onboardingSeen, true);
    _isSeen = true;
    notifyListeners();
  }
}
