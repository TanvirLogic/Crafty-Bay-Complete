import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bay/features/common/presentation/widgets/theme_selector.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
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
                      context.localizatons.signUp,
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                    Text(context.localizatons.getStarted),
                    TextFormField(
                      controller: _firstNameController,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: context.localizatons.firstName,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localizatons.firstNameHint;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: context.localizatons.lastName,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localizatons.lastNameHint;
                        }
                        return null;
                      },
                    ),
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
                    TextFormField(
                      controller: _phoneController,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: context.localizatons.phoneNumber,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localizatons.phoneHint;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        hintText: context.localizatons.address,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localizatons.address;
                        }
                        return null;
                      },
                    ),
                    FilledButton(
                      onPressed: _onTapSignUpButton,
                      child: Text(context.localizatons.signUp),
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

 void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, VerifyOTPScreen.name);
    }
  }

  void _onTapSignInButton() {
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
