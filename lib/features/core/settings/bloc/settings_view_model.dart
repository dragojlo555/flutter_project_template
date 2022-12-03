import '../../../../base/model_view_base.dart';
import '../../../../utils/services/local_storage/shared_preferences_helper.dart';

class SettingsViewModel extends ViewModelBase {
  String? _languageCode;

  SettingsViewModel(String? languageCode) {
    if (languageCode?.isEmpty ?? true) {
      _languageCode = 'en';
    } else {
      _languageCode = languageCode;
    }
    notifyListeners();
  }

  // setLanguage(String code) => _languageCode = code;

  String? get languageCode => _languageCode;

  void getLanguageCode() async {
    _languageCode = await SharedPreferencesHelper.getLanguageCode();
  }

  void setLanguageCode(languageCode) {
    SharedPreferencesHelper.setLanguageCode(languageCode);
    _languageCode = languageCode;
    notifyListeners();
  }
}
