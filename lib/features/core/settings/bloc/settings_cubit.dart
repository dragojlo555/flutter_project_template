import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/services/local_storage/shared_preferences_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required String languageCode}) : super(SettingsState(languageCode: languageCode));

  void setLanguageCode(languageCode) {
    SharedPreferencesHelper.setLanguageCode(languageCode);
    emit(SettingsState(languageCode: languageCode));
  }
}
