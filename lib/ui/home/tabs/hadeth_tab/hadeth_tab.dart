import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/hadeth_details/hadeth_details.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami_app/ui/home/widgets/base_tab.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = List.filled(50, Hadeth("", "", 0));

  @override
  void initState() {
    super.initState();
    loadAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BaseTab(
      image: "assets/images/hadith_bg.png",
      child: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/img_header.png",
                  width: width * 0.6,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                itemBuilder: (context, index, realIndex) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadethDetails.routeName,
                      arguments: ahadeth[index],
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(32),
                      image: DecorationImage(
                        image: AssetImage("assets/images/img_hadeth_bg.png"),
                        opacity: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage(
                                  "assets/images/img_left_corner.png",
                                ),
                                color: AppColors.black,
                                size: 70,
                              ),
                              Expanded(
                                child: Text(
                                  ahadeth[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.labelLargeStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              ImageIcon(
                                AssetImage(
                                  "assets/images/img_right_corner.png",
                                ),
                                color: AppColors.black,
                                size: 70,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              ahadeth[index].content,
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyLargeStyle(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/img_card_decoration.png",
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ),
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.25,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadAhadeth() async {
    String fileContent = await PlatformAssetBundle().loadString(
      "assets/suras/ahadeeth.txt",
    );
    List<String> ahadethContent = fileContent.trim().split("#");
    for (int i = 0; i < ahadethContent.length; i++) {
      var hadethLines = ahadethContent[i].trim().split("\n");
      var title = hadethLines.first;
      var content = hadethLines.sublist(1).join(" ");
      var hadeth = Hadeth(title, content, i);
      ahadeth[i] = hadeth;
    }
    setState(() {});
  }
}