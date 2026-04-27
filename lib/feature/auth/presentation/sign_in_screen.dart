

import 'package:flutter/material.dart';

import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Не забудь импортировать свой HomeScreen и AuthBody

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final SupabaseClient client = Supabase.instance.client;
  final _key = GlobalKey<FormState>();

  void signIn() async {
    // Проверяем валидацию перед отправкой запроса
    if (_key.currentState!.validate()) {
      try {
        final response = await client.auth.signInWithPassword(
          email: emailController.text.trim(), // trim() убирает случайные пробелы
          password: passwordController.text,
        );

        if (response.user != null && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Вход выполнен успешно'),
            ),
          );
          // Переход на главный экран
          Navigator.pushReplacementNamed(context, '/home');
          // Или используй MaterialPageRoute, как в SignUp:
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Ошибка входа: Неверный email или пароль'),
            ),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Welcome Back',
      textButton: 'Sign in', // Меняем текст кнопки на вход
      onPressed: signIn, // Вызываем функцию входа
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextFormField(
              title: 'Email address', // Для Supabase нужен email, а не username
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            AppTextFormField(
              title: 'Password',
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            // Опционально: кнопка для перехода на экран регистрации, если аккаунта нет
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
