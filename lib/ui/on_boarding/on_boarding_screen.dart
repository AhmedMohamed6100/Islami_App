import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/ui/home/home_view.dart';

import 'dot_indicator.dart';
import 'on_boarding_model.dart';
import 'onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/img_header.png"),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemCount: OnBoardingModel.onboardingDate.length,
              itemBuilder: (context, index) =>
                  OnboardingPage(model: OnBoardingModel.onboardingDate[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: currentIndex != 0,
                      child: TextButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: AppColors.gold,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        if  (currentIndex == OnBoardingModel.onboardingDate.length - 1) {
                          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          return;
                        }
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        currentIndex < OnBoardingModel.onboardingDate.length - 1
                            ? "Next"
                            : "Finish",
                        style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    OnBoardingModel.onboardingDate.length,
                    (index) =>
                        DotIndicator(index: index, currentIndex: currentIndex),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
