import 'package:flutter/material.dart';
import 'package:islami_app/providers/azkar_provider.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:provider/provider.dart';

class FavAzkarScreen extends StatelessWidget {
  static const String routeName = 'favAzkar';

  const FavAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text("الأذكار المفضلة"),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
      ),
      // استخدام Consumer يضمن إعادة بناء هذه الجزئية فقط عند تغير البيانات
      body: Consumer<AzkarProvider>(
        builder: (context, azkarProvider, child) {
          var favorites = azkarProvider.favAzkar;

          if (favorites.isEmpty) {
            return Center(
              child: Text(
                "لا يوجد أذكار في المفضلة",
                style: TextStyles.labelLargeStyle(color: AppColors.gold.withOpacity(0.5)),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final zekr = favorites[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.gold, width: 1),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite, color: AppColors.gold),
                          onPressed: () {
                            azkarProvider.toggleFavorite(zekr);
                          },
                        ),
                      ],
                    ),
                    Text(
                      zekr,
                      textAlign: TextAlign.center,
                      style: TextStyles.labelMediumStyle(color: AppColors.gold),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
