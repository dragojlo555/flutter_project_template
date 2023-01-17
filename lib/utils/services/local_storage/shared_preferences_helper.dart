import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/app_constants.dart';

class SharedPreferencesHelper {
  static void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.sharedPreferencesTokenKey, token);
  }

  static void clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.sharedPreferencesTokenKey);
  }

  static void setLanguageCode(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.sharedPreferencesLanguage, languageCode);
  }

  static Future<String> getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.sharedPreferencesLanguage) ?? 'en';
  }
}
