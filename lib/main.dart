import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/feature/main/presentation/detail_screen.dart';
import 'package:marketplace/feature/product_screen.dart';
import 'package:marketplace/service/product_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'cubit/product_cubit.dart';
import 'feature/auth/presentation/sign_in_screen.dart';
import 'feature/auth/presentation/sign_up_screen.dart';
import 'feature/auth/presentation/splash_screen.dart';
import 'feature/main/presentation/home_screen.dart';


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
    return BlocProvider(
      create: (context) => ProductCubit(ProductService()),
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => SplashScreen(),
        //   '/login': (context) => SignInScreen(),
        //   '/register': (context) => SignUpScreen(),
        //   '/home': (context) => HomeScreen(),
        // },

        home: ProductScreen(),

      ),
    );
  }
}
