class AppLocale {
  final String locale;
  final String language;

  const AppLocale({required this.locale, required this.language});

  static const List<AppLocale> myLocales = [
    AppLocale(language: 'English', locale: 'en'),
    AppLocale(language: 'Serbian', locale: 'sr')
  ];
}
