import 'package:flutter/material.dart';
import 'package:islami_app/providers/favorites_provider.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/sura_item.dart';
import 'package:islami_app/ui/home/widgets/base_tab.dart';
import 'package:provider/provider.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoritesProvider>(context);
    var width = MediaQuery.of(context).size.width;

    return BaseTab(
      image: "assets/images/quran_tab_bg.png",
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
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: AppColors.gold,
                    labelColor: AppColors.gold,
                    unselectedLabelColor: AppColors.white,
                    tabs: [
                      Tab(text: "Suras"),
                      Tab(text: "Hadiths"),
                      Tab(text: "Azkar"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildSurasFav(provider),
                        _buildHadethFav(provider),
                        _buildAzkarFav(provider),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurasFav(FavoritesProvider provider) {
    if (provider.favSuras.isEmpty) return _buildEmptyState("No Favorite Suras");
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (_, index) => SuraItem(sura: provider.favSuras[index]),
      separatorBuilder: (_, __) => Divider(color: AppColors.gold, thickness: 0.5),
      itemCount: provider.favSuras.length,
    );
  }

  Widget _buildHadethFav(FavoritesProvider provider) {
    if (provider.favHadeths.isEmpty) return _buildEmptyState("No Favorite Hadiths");
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (_, index) => ListTile(
        title: Text(provider.favHadeths[index].name, style: TextStyles.labelMediumStyle(color: AppColors.gold)),
        trailing: IconButton(
          icon: Icon(Icons.favorite, color: AppColors.gold),
          onPressed: () => provider.toggleHadeth(provider.favHadeths[index]),
        ),
      ),
      separatorBuilder: (_, __) => Divider(color: AppColors.gold, thickness: 0.5),
      itemCount: provider.favHadeths.length,
    );
  }

  Widget _buildAzkarFav(FavoritesProvider provider) {
    if (provider.favAzkar.isEmpty) return _buildEmptyState("No Favorite Azkar");
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (_, index) => ListTile(
        title: Text(
          provider.favAzkar[index],
          textAlign: TextAlign.right,
          style: TextStyles.bodyMediumStyle(color: AppColors.gold),
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite, color: AppColors.gold),
          onPressed: () => provider.toggleZekr(provider.favAzkar[index]),
        ),
      ),
      separatorBuilder: (_, __) => Divider(color: AppColors.gold, thickness: 0.5),
      itemCount: provider.favAzkar.length,
    );
  }

  Widget _buildEmptyState(String msg) {
    return Center(
      child: Text(msg, style: TextStyles.labelLargeStyle(color: AppColors.white.withOpacity(0.5))),
    );
  }
}
