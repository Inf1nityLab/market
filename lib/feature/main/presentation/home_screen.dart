

import 'package:flutter/material.dart';
import 'package:marketplace/shared/circle_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout() async {
    try {
      await Supabase.instance.client.auth.signOut();

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: CircleButton(
        //   image: 'assets/images/women.png',
        //   onTap: (){},
        // ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              onPressed: logout,
              child: Text(
                'Выйти из приложения',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),


      body: TextButton(
        onPressed: logout,
        child: Text(
          'Выйти из приложения',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}