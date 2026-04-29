
import 'package:flutter/material.dart';
import 'package:marketplace/feature/main/presentation/detail_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/login': (context) => SignInScreen(),
      //   '/register': (context) => SignUpScreen(),
      //   '/home': (context) => HomeScreen(),
      // },

      home: DetailScreen(),

    );
  }
}
