import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/models/sura.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadethDetails";

  final Hadeth hadeth;

  const HadethDetails({required this.hadeth, super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(widget.hadeth.name),
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
                        widget.hadeth.name,
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
                    widget.hadeth.content,
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
