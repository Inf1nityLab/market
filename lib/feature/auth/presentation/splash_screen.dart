import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/presentation/onboarding.dart';
import 'package:marketplace/test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      _redirect();
    });
  }

  void _redirect() async {
    try {
      final session = await Supabase.instance.client.auth.currentSession;

      if(!mounted) return;

      if (session != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      if(!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {}, child: Text('Splash')),
      ),
    );
  }
}
