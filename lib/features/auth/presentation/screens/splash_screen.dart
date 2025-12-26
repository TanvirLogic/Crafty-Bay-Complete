import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  Future<void> nextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignUpScreen.name,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Spacer(),
            AppLogoWidget(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}


