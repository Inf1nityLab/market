import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';

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

      ),
    );
  }
}
