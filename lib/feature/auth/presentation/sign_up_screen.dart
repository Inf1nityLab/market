import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/app_text_form_field.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../test.dart';
import '../../main/presentation/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final SupabaseClient client = Supabase.instance.client;
  final _key = GlobalKey<FormState>();

  void signUp() async {
    try {
      if (_key.currentState!.validate()) {
        final response = await client.auth.signUp(
          password: passwordController.text,
          email: emailController.text,
        );

        if (response.user != null && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(backgroundColor: Colors.green,
              content: Text('Регистрация прошла успешна')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text('Регистрация провалено')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Sign up',
      textButton: 'Sign up',
      onPressed: () {
        signUp();
      },
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            AppTextFormField(
              title: 'Username',
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            AppTextFormField(
              title: 'Password',
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            AppTextFormField(
              title: 'Email addres',
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}


