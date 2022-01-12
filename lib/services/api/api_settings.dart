class ApiSettings {
  static const String _apiBaseUrl = 'http://demo-api.mr-dev.tech/api/';
  static const String usersIndex = _apiBaseUrl + 'users';
  static const String categoriesIndex = _apiBaseUrl + 'categories';

  static const String studentLogin = _apiBaseUrl + 'students/auth/login';
  static const String studentLogout = _apiBaseUrl + 'students/auth/logout';
  static const String studentResetPassword =
      _apiBaseUrl + 'students/auth/reset-password';
  static const String studentForgetPassword =
      _apiBaseUrl + 'students/auth/forget-password';
}
