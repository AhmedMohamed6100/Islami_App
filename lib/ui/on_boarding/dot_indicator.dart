import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.index, required this.currentIndex});

  final int index ;
  final int currentIndex ;

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex ;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isActive ? 16 : 8,
      height: 8,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color:isActive ? AppColors.gold : AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
