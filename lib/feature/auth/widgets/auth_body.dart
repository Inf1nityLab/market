import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  final String title;
  final String textButton;
  final Widget body;
  final String? bottomText;
  final String? bottomTextButton;
  final bool visible;

  const AuthBody({
    super.key,
    required this.title,
    required this.textButton,
    required this.body,
    this.bottomText,
    this.bottomTextButton,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xFFFEFEFE),
        leading: CircleAvatar(child: Icon(Icons.arrow_back)),
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
            Visibility(
              visible: visible,
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Text('$bottomText'),
                  TextButton(
                      onPressed: () {}, child: Text('$bottomTextButton')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {},
        child: Text(textButton),
      ),
    );
  }
}
