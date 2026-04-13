import 'package:flutter/material.dart';

class AppRegisterButton extends StatelessWidget {
  final String text;
  final int color;
  final String image;

  const AppRegisterButton({
    super.key,
    required this.text,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text(text, style: TextStyle(color: Colors.white),),
        icon: Image.asset(image),
        style: ElevatedButton.styleFrom(backgroundColor: Color(color)),
      ),
    );
  }
}
