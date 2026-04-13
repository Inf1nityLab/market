
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/presentation/forgot_password_screen.dart';
import 'package:marketplace/feature/auth/presentation/google_auth_screen.dart';
import 'package:marketplace/feature/auth/presentation/onboarding.dart';
import 'package:device_preview/device_preview.dart';
import 'package:marketplace/feature/auth/presentation/sign_in_screen.dart';
import 'package:marketplace/feature/auth/presentation/sign_up_screen.dart';
import 'package:marketplace/feature/auth/presentation/splash_screen.dart';


void main() => runApp(
   MyApp(), // Wrap your app

);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const GoogleAuthScreen(),
    );
  }
}

class LestStarte extends StatelessWidget {
  const LestStarte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ElevatedButton(onPressed: (){}, child: Text('Hello')),
      appBar: AppBar(),
      body: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(text: "У вас есть аккаунт? "),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                onPressed: () {
                  // Действие при нажатии
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "Войти",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


