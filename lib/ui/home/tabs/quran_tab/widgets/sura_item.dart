import 'package:flutter/material.dart';
import 'package:islami_app/theme/text_styles.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_app/ui/sura_details/sura_details.dart';

class SuraItem extends StatelessWidget {
  final Sura sura;

  const SuraItem({required this.sura, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/aya_numer_shape.png", height: 52),
              Text(sura.id.toString(), style: TextStyles.labelMediumStyle()),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.nameEn, style: TextStyles.titleMediumSmall()),
                SizedBox(height: 8),
                Text(sura.versesNumber, style: TextStyles.titleMediumSmall()),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(sura.nameAr, style: TextStyles.titleMediumSmall()),
        ],
      ),
    );
  }
}
