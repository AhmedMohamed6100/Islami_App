import 'package:flutter/material.dart';
import 'package:islami_app/providers/azkar_provider.dart';
import 'package:islami_app/ui/hadeth_details/hadeth_details.dart';
import 'package:islami_app/ui/home/home_view.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_app/ui/intro/intro_screen.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/ui/sura_details/sura_details.dart';
import 'package:islami_app/ui/time/azkar_details_screen.dart';
import 'package:islami_app/ui/time/fav_azkar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AzkarProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        OnBoardingScreen.routeName :(context) => OnBoardingScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (context) {
          var sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura);
        },
        HadethDetails.routeName: (context) {
          var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
          return HadethDetails(hadeth: hadeth);
        },
        AzkarDetailsScreen.routeName: (context) {
          var title = ModalRoute.of(context)?.settings.arguments as String;
          return AzkarDetailsScreen(title: title);
        },
        FavAzkarScreen.routeName: (context) => FavAzkarScreen(),
      },
      initialRoute: IntroScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
