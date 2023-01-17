part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final String languageCode;

  const SettingsState({required this.languageCode});

  SettingsState copyWith({String? languageCode}) {
    return SettingsState(languageCode: languageCode ?? this.languageCode);
  }

  @override
  List<Object> get props => [languageCode];
}
