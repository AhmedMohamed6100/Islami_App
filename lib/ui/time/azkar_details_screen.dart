import 'package:flutter/material.dart';
import 'package:islami_app/providers/azkar_provider.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/time/fav_azkar_screen.dart';
import 'package:provider/provider.dart';

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
    var azkarProvider = Provider.of<AzkarProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(widget.title.contains('Morning') ? "أذكار الصباح" : "أذكار المساء"),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: AppColors.gold),
            onPressed: () => Navigator.pushNamed(context, FavAzkarScreen.routeName),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isFav = azkarProvider.isFavorite(items[index].text);
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(items[index].count == 0 ? 0.05 : 0.15),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.gold, width: 1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // أيقونة المفضلة (القلب)
                    IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.gold,
                      ),
                      onPressed: () {
                        azkarProvider.toggleFavorite(items[index].text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isFav ? "تم الإزالة من المفضلة" : "تم الإضافة للمفضلة"),
                            duration: const Duration(seconds: 1),
                            backgroundColor: AppColors.gold,
                          ),
                        );
                      },
                    ),
                    // أيقونة التنبيه (الساعة)
                    IconButton(
                      icon: const Icon(Icons.access_time, color: AppColors.gold),
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
                      color: items[index].count == 0 ? Colors.grey : AppColors.gold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CircleAvatar(
                  backgroundColor: AppColors.gold,
                  child: Text(
                    "${items[index].count}",
                    style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
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
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
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
      AzkarItem(text: "اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِليك النُّشُورُ", count: 1),
      AzkarItem(text: "سُبْحَانَ اللهِ وَبِحَمْدِهِ (100 مرة)", count: 100),
      AzkarItem(text: "أعوذ بكلمات الله التامات من شر ما خلق", count: 3),
      AzkarItem(text: "رضيت بالله رباً، وبالإسلام ديناً، وبمحمد صلى الله عليه وسلم نبياً", count: 3),
      AzkarItem(text: "بسم الله الذي لا يضر مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم", count: 3),
      AzkarItem(text: "حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم (7 مرات)", count: 7),
      AzkarItem(text: "اللهم إني أسألك العافية في الدنيا والآخرة", count: 1),
    ];
  }

  List<AzkarItem> _getEveningAzkar() {
    return [
      AzkarItem(text: "أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ", count: 1),
      AzkarItem(text: "اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ الْمَصِيرُ", count: 1),
      AzkarItem(text: "يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ", count: 1),
      AzkarItem(text: "أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ (100 مرة)", count: 100),
      AzkarItem(text: "أعوذ بكلمات الله التامات من شر ما خلق (3 مرات)", count: 3),
      AzkarItem(text: "اللهم صل وسلم على نبينا محمد (10 مرات)", count: 10),
    ];
  }
}

class AzkarItem {
  final String text;
  int count;
  AzkarItem({required this.text, required this.count});
}
