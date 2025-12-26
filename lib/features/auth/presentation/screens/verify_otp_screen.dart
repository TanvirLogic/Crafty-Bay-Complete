import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bay/features/common/presentation/widgets/theme_selector.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});
  static const String name = '/verify-otp-screen';
  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 110,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: LanguageSelector(),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 105,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: ThemeSelector(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppLogoWidget(width: 80),
                    Text(
                      context.localizatons.login,
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                    //  Text(context.localizatons.getStarted),
                    TextFormField(
                      controller: _otpController,
                      decoration: InputDecoration(hintText: 'Enter OTP'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter OTP';
                        }
                        return null;
                      },
                    ),
                    FilledButton(
                      onPressed: _onTapSignInButton,
                      child: Text(context.localizatons.login),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        text: context.localizatons.alreadyHaveAccount,
                        children: [
                          TextSpan(
                            text: "   ${context.localizatons.login}",
                            style: TextStyle(color: Colors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyOTPButton() {}

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
