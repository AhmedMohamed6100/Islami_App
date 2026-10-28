import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/models/sura.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "suraDetails";

  final Sura sura;

  const SuraDetails({required this.sura, super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String? suraContent;

  @override
  void initState() {
    super.initState();
    getSuraDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(widget.sura.nameEn),
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
                        widget.sura.nameAr,
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
                child: suraContent == null? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.gold,
                  ),
                ): SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    suraContent??"",
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

  void getSuraDetails() async {

    String suraDetailsText = await rootBundle.loadString(
      'assets/suras/${widget.sura.id}.txt',
    );
    var ayasList = suraDetailsText
        .trim()
        .split("\n")
        .map((aya) => aya.trim())
        .toList().join(" || ");
    // suraDetailsText = "";
    // for (int i = 0; i < ayasList.length; i++) {
    //   suraDetailsText = "$suraDetailsText [${i + 1}] ${ayasList[i]}";
    // }
    suraContent = ayasList;
    setState(() {});
  }
}
