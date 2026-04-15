import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';
import 'package:marketplace/feature/auth/widgets/otp_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: 'Verification',
      textButton: 'Hello',
      body: Column(children: [
        Row(
          spacing: 10,
          children: [
            OtpWidget(),
            OtpWidget(),
            OtpWidget(),
            OtpWidget(),
          ],
        ),
      ]),
    );
  }
}
