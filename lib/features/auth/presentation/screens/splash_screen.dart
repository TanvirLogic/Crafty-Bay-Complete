import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/app/providers/language_provider.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(child: Text(context.localizatons.home)),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.changeLanguage),
              LanguageSelector(),
            ],
          ),
        ],
      ),
    );
  }

  _onPressedChangeLanguageButton() {}
}
