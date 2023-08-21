part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.rSplash;
  static const LOGIN = _Paths.rLoginScreen;
  static const SIGNUP = _Paths.rSignUpScreen;
  static const DASHBOARD = _Paths.rDashboard;
}

abstract class _Paths {
  static const rSplash = "/";
  static const rLoginScreen = "/login";
  static const rSignUpScreen = "/signup";
  static const rDashboard = "/dashboard";
}
