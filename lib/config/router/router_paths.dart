class RouterPages{
  static const String path = '/';
  static const String login = 'login';
  static const String registration ='registration';
  static const String detail ='detail';

}

class RouterPaths{
  static const String home = RouterPages.path;
  static const String login = RouterPages.path + RouterPages.login;
  static const String registration = RouterPages.path + RouterPages.registration;
  static const String detail ='${RouterPages.path} + ${RouterPages.detail}/';
}