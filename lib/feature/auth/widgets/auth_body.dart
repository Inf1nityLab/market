import 'package:flutter/material.dart';
import 'package:marketplace/shared/circle_button.dart';

class AuthBody extends StatelessWidget {
  final String title;
  final String textButton;
  final Widget body;
  final String? bottomText;
  final String? bottomTextButton;
  final Function()? onPressed;

  const AuthBody({
    super.key,
    required this.title,
    required this.textButton,
    required this.body,
    this.bottomText,
    this.bottomTextButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xFFFEFEFE),
        leading: CircleButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
              ),
            ),
            Expanded(child: body),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: onPressed,
        child: Text(textButton),
      ),
    );
  }
}
