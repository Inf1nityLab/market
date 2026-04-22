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

import 'feature/main/presentation/home_screen.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://cmhwxpowyhecaymjgrxw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNtaHd4cG93eWhlY2F5bWpncnh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyOTU0MjIsImV4cCI6MjA4ODg3MTQyMn0.AaKsfopBz0lJqAsNA_JWwb4ZdGsFYtta0MlTpQjR_FM',
  );

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
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => SignInScreen(),
        '/register': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
      },

    );
  }
}
