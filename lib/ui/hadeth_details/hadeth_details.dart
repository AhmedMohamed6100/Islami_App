import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/models/hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadethDetails";

  final Hadeth hadeth;

  const HadethDetails({required this.hadeth, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(hadeth.name),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
      ),
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Image.asset(
            "assets/images/img_bottom_decoration.png",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/img_left_corner.png"),
                    Expanded(
                      child: Text(
                        hadeth.name,
                        textAlign: TextAlign.center,
                        style: TextStyles.titleLargeStyle(
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                    Image.asset("assets/images/img_right_corner.png"),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    hadeth.content,
                    textAlign: TextAlign.center,
                    style: TextStyles.labelMediumStyle(color: AppColors.gold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
