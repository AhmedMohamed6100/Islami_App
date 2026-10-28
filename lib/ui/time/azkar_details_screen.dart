import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';

class AzkarDetailsScreen extends StatefulWidget {
  static const String routeName = 'azkarDetails';
  final String title;

  const AzkarDetailsScreen({required this.title, super.key});

  @override
  State<AzkarDetailsScreen> createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  late List<AzkarItem> items;

  @override
  void initState() {
    super.initState();
    items = widget.title.contains('Morning') ? _getMorningAzkar() : _getEveningAzkar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(items[index].count == 0 ? 0.1 : 0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.gold, width: 1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_circle_outline, color: AppColors.gold),
                      onPressed: () => _showReminderPicker(context, items[index].text),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (items[index].count > 0) items[index].count--;
                    });
                  },
                  child: Text(
                    items[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyles.labelMediumStyle(
                      color: items[index].count == 0 ? AppColors.white.withOpacity(0.5) : AppColors.gold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  backgroundColor: AppColors.gold,
                  child: Text(
                    "${items[index].count}",
                    style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _showReminderPicker(BuildContext context, String zekr) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.gold,
              onPrimary: AppColors.black,
              surface: AppColors.black,
              onSurface: AppColors.gold,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  List<AzkarItem> _getMorningAzkar() {
    return [
      AzkarItem(text: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ", count: 1),
      AzkarItem(text: "اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ", count: 1),
      AzkarItem(text: "سُبْحَانَ اللهِ وَبِحَمْدِهِ", count: 100),
      AzkarItem(text: "أعوذ بكلمات الله التامات من شر ما خلق", count: 3),
    ];
  }

  List<AzkarItem> _getEveningAzkar() {
    return [
      AzkarItem(text: "أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ", count: 1),
      AzkarItem(text: "اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ الْمَصِيرُ", count: 1),
      AzkarItem(text: "يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ", count: 1),
      AzkarItem(text: "أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ", count: 100),
    ];
  }
}

class AzkarItem {
  final String text;
  int count;
  AzkarItem({required this.text, required this.count});
}
