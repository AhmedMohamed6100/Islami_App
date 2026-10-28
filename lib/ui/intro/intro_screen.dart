import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "intro";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/mosque.png",
                    width: width * 0.7,
                  ).zoomIn(duration: Duration(milliseconds: 600)),
                ],
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/islami_logo.png",
              width: width * 0.4,
            ).zoomIn(duration: Duration(milliseconds: 600)),
          ),
          Positioned(
            right: width * 0.02,
            child: Image.asset("assets/images/candle.png").slideDown(),
          ),

          Positioned(
            left: 0,
            top: height * 0.2,
            child: Image.asset("assets/images/left_shape.png").slideInLeft(),
          ),
          Positioned(
            right: 0,
            bottom: height * 0.2,
            child: Image.asset("assets/images/right_shape.png").slideInRight(),
          ),
        ],
      ),
    );
  }
}
