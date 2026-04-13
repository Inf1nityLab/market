import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/app_choice_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {


  int selectedButton = 0;

  List<String> data = [
    'Men',
    'Women'
  ];

  List<String> images = [
    'assets/images/onboarding.png',
    'assets/images/wom.png'
  ];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images[selectedButton]),
          ),
          gradient: LinearGradient(
            colors: [Color(0xFFB0A3E5), Color(0xFF7661C5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          height: height * 0.245,
          width: double.infinity,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AppChoiceButton(
                      text: data[index],
                      color: selectedButton == index ? 0xFF9775FA : 0xFFFFFFFF,
                      textColor:  selectedButton == index ? 0xFFFFFFFF : 0xFF8F959E,
                      onPressed: (){
                        setState(() {
                          selectedButton = index;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
