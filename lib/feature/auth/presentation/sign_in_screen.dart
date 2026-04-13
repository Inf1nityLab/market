

import 'package:flutter/material.dart';

import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Welcome',
      textButton: 'Sign up',
      body: Column(
        mainAxisAlignment: .center,
        children: [
          AppTextFormField(title: 'Username'),
          AppTextFormField(title: 'Password'),
        ],
      ),
    );;
  }
}
