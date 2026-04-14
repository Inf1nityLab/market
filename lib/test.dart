import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String name;
  final double width;
  final Color kraska;
  final Color textColor;

  const AppButton({
    super.key,
    required this.name,
    this.width = 200,
    this.kraska = Colors.indigoAccent,
     this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kraska,
        minimumSize: Size(width, 50),
      ),
      child: Text(name, style: TextStyle(color: textColor)),
    );
  }
}
