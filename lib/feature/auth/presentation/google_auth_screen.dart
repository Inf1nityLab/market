import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/app_register_button.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';
import 'package:marketplace/feature/auth/widgets/rich_text_button.dart';

class GoogleAuthScreen extends StatelessWidget {
  const GoogleAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: "Let's get started",
      textButton: 'Create aacount',
      bottomText: 'Hello',
      bottomTextButton: 'Hi',
      body: Column(
        children: [
          AppRegisterButton(text: 'Facebbok', color: 0xFF4267B2, image: ''),
          AppRegisterButton(text: 'Twitter', color: 0xFF4267B2, image: ''),
          AppRegisterButton(text: 'Google', color: 0xFF4267B2, image: ''),

          RichTextButton(
            textOne: '',
            textTwo: 'Already have an account',
            textButton: 'Sign in',
          ),
          RichTextButton(
            textOne: '',
            textTwo:
                'By connecting your account confirm that you agree with our',
            textButton: 'Term and Condition',
          ),
        ],
      ),
    );
  }
}
