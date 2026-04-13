import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/app_text_form_field.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Sign up',
      textButton: 'Sign up',
      body: Column(
        mainAxisAlignment: .center,
        children: [
          AppTextFormField(title: 'Username'),
          AppTextFormField(title: 'Password'),
          AppTextFormField(title: 'Email addres'),
        ],
      ),
    );
  }
}
