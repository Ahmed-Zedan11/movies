import 'package:injectable/injectable.dart';
import 'package:movies_app/src/config/resources/constants_manger.dart';
import 'package:movies_app/src/core/errors/app_exceptions.dart';
import 'package:movies_app/src/features/auth/data/data%20source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(CachConstatnt.tokenKey)!;
    } catch (exception) {
      throw LocaleException(message: "failed to get token");
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(CachConstatnt.tokenKey, token);
    } catch (exception) {
      throw LocaleException(message: "failed to save token");
    }
  }
}
