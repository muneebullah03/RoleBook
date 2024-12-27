import 'package:contact_app/res/colors/app_colors.dart';

import 'package:flutter/material.dart';

import '../res/components/onborading/onboarding_data.dart';
import 'login_scree.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  final contoller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [body(), dotsRow(), button()],
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: PageView.builder(
          itemCount: contoller.item.length,
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  contoller.item[index].image,
                ),
                SizedBox(height: 10),
                Text(
                  contoller.item[index].title,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  contoller.item[index].description,
                  style: TextStyle(color: AppColors.grayText),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }),
    );
  }

  Widget dotsRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              contoller.item.length,
              (index) => AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: currentIndex == index
                          ? AppColors.primaryColor
                          : AppColors.grayText),
                  height: 7,
                  width: currentIndex == index ? 50 : 25,
                  duration: Duration(milliseconds: 500)))),
    );
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor,
          ),
          child: TextButton(
            onPressed: () {
              if (currentIndex != contoller.item.length - 1) {
                pageController.animateToPage(
                  currentIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            },
            child: Text(
              currentIndex == contoller.item.length - 1
                  ? "Get Started"
                  : "Continue",
              style: TextStyle(color: AppColors.witheText),
            ),
          )),
    );
  }
}
