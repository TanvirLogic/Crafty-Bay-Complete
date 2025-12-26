import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bay/features/common/presentation/widgets/theme_selector.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                      controller: _emailController,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: context.localizatons.email,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localizatons.emailHint;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: context.localizatons.password,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localizatons.passwordHint;
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
                        text: context.localizatons.dontHaveAccount,
                        children: [
                          TextSpan(
                            text: "   ${context.localizatons.getStarted}",
                            style: TextStyle(color: Colors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignUpButton,
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

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {}
  }

  void _onTapSignUpButton() {
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
