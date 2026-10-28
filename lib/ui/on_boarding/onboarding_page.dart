import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.model});

  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage(model.image),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    model.description ?? " ",
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
