import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textButton;
  final Function()? onPressed;

  const RichTextButton({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textButton,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: textOne,
        style: TextStyle(color: Colors.red),
        children: [
          TextSpan(
            text: textTwo,
            style: TextStyle(color: Colors.grey),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              onPressed: onPressed,
              child: Text(textButton, style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
