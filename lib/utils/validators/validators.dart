const String _emailRule =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

class Validators {
  static String? validEmail(String email) {
    final RegExp emailExp = RegExp(_emailRule);
    if (!emailExp.hasMatch(email) || email.isEmpty) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validPassword(String password) {
    // final RegExp emailExp = new RegExp(_kMin4CharsOneUpperOneLowerOneNumberOneSpecial);
    // if (!emailExp.hasMatch(password) || password.isEmpty) {
    if (password.length < 6 || password.isEmpty) {
      return 'Password must contain at least 6 characters';
    } else {
      return null;
    }
  }

  static String? validConfirmPassword(String password, String firstPassword) {
    // final RegExp emailExp = new RegExp(_kMin4CharsOneUpperOneLowerOneNumberOneSpecial);
    // if (!emailExp.hasMatch(password) || password.isEmpty) {
    if (password.length < 6 || password.isEmpty) {
      return '*Password must contain at least 6 characters';
    } else if (password != firstPassword) {
      return '*Password doesn\'t match';
    } else {
      return null;
    }
  }
}
