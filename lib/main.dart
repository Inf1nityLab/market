import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/presentation/forgot_password_screen.dart';
import 'package:marketplace/feature/auth/presentation/google_auth_screen.dart';
import 'package:marketplace/feature/auth/presentation/onboarding.dart';
import 'package:device_preview/device_preview.dart';
import 'package:marketplace/feature/auth/presentation/sign_in_screen.dart';
import 'package:marketplace/feature/auth/presentation/sign_up_screen.dart';
import 'package:marketplace/feature/auth/presentation/splash_screen.dart';
import 'package:marketplace/feature/auth/presentation/verification_screen.dart';
import 'package:marketplace/test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {


  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SignUpScreen(),
    );
  }
}


