

import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/image_body.dart';

import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Forgot Password',
      textButton: 'Sign up',
      visible: false,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ImageBody(),
          AppTextFormField(title: 'Username'),

        ],
      ),
    );
  }
}
