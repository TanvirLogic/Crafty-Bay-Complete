import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings setting){
    late Widget widget;
    if(setting.name==SplashScreen.name){
      widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (context) => widget,);
  }
}