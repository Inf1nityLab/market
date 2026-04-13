import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String title;

  const AppTextFormField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 20),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [Text(title), TextFormField()],
      ),
    );
  }
}
