import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings setting) {
    Widget widget = SizedBox();
    if (setting.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (setting.name == SignUpScreen.name) {
      widget = SignUpScreen();
    } else if (setting.name == SignInScreen.name) {
      widget = SignInScreen();
    } else if (setting.name == VerifyOTPScreen.name) {
      widget = VerifyOTPScreen();
    } else if (setting.name == MainNavHolderScreen.name) {
      widget = MainNavHolderScreen();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
