import 'package:get/get.dart';

import '../modules/login/login_screen.dart';
import '../splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.rSplash,
        page: () => const SplashScreen(),
        preventDuplicates: true),
    GetPage(
      name: _Paths.rLoginScreen,
      preventDuplicates: true,
      page: () => const LoginScreen(),
      // middlewares: [AuthMiddleware()]
    ),
    // GetPage(name: _Paths.rSignUpScreen, page: () => SignUpScreen()),
    // GetPage(
    //     name: _Paths.rDashboard,
    //     page: () => Dashboard(),
    //     preventDuplicates: true,
    //     binding: DashboardBinding()),
  ];
}
