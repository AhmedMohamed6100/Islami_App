import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double angle = 0;
  int counter = 0;
  int index = 0;
  void onClick() {
    angle += 20;
    counter++;
    if (counter == 34) {
      counter = 0;
      if (index == azkar.length - 1) {
        index = 0;
      }
      index++;
    }
    setState(() {});
  }

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
    "أستغفر الله",
    "لا حول ولا قوة إلا بالله",
    "اللهم صلِّ على محمد",
    "اللهم اغفر لي وارحمني",
    "رضيت بالله ربًا وبالإسلام دينًا وبمحمد ﷺ نبيًا",
    "حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم"
  ];
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background sebha.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/img_header.png"),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: screenHight * .08),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: onClick,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          "assets/images/SebhaBody 1.png",
                          width: screenWidth,
                          height: screenHight * .6,
                        ),
                      ),

                      Positioned(
                        top: -screenHight * .05,
                        child: Image.asset(
                          "assets/images/SebhaBody 2.png",
                          width: screenWidth * .5,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      azkar[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "$counter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
