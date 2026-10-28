import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';

class BaseTab extends StatelessWidget {
  final String image;
  final Widget child;

  const BaseTab({required this.image, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black.withAlpha(70),
                AppColors.black,
              ],
              end: AlignmentGeometry.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
