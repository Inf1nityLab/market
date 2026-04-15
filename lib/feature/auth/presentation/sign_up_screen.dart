import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/app_text_form_field.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  void signUp() async {
    try {
      final response = await client.auth.signUp(
        password: passwordController.text,
        email: emailController.text,
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Sign up',
      textButton: 'Sign up',
      onPressed: () {
        signUp();
      },
      body: Column(
        mainAxisAlignment: .center,
        children: [
          AppTextFormField(title: 'Username', controller: nameController),
          AppTextFormField(title: 'Password', controller: passwordController),
          AppTextFormField(title: 'Email addres', controller: emailController),
        ],
      ),
    );
  }
}
