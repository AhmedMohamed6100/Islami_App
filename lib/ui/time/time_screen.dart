import 'package:flutter/material.dart';
import 'package:islami_app/theme/colors.dart';
import 'package:islami_app/ui/time/azkar_details_screen.dart';
import 'package:islami_app/ui/time/fav_azkar_screen.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background_time_screen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/img_header.png"),
          const SizedBox(height: 20),
          // Prayer Time Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/ic_sebha.png"),
                  opacity: 0.05,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('16 Jul.', style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('Pray Time', style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('09 Muh, 1446', style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Tuesday', style: TextStyle(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildPrayerTime('fagr', '04:00 AM'),
                        const SizedBox(width: 12),
                        _buildPrayerTime('Dhuhr', '01:01 PM'),
                        const SizedBox(width: 12),
                        _buildPrayerTime('ASR', '04:38 PM'),
                        const SizedBox(width: 12),
                        _buildPrayerTime('Maghrib', '07:57 PM'),
                        const SizedBox(width: 12),
                        _buildPrayerTime('Isha', '09:30 PM'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next Pray - 02:32', style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(width: 12),
                      Icon(Icons.volume_up, color: AppColors.black, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          
          // قسم الأذكار مع زر المفضلة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Azkar',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // زر الذهاب للمفضلة
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, FavAzkarScreen.routeName);
                  },
                  icon: const Icon(Icons.favorite, color: AppColors.black, size: 18),
                  label: const Text("Favorites", style: TextStyle(color: AppColors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gold,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildAzkarCard(context, 'Evening Azkar', 'assets/images/evening_azkar.png'),
                  _buildAzkarCard(context, 'Morning Azkar', 'assets/images/morning_azkar.png'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPrayerTime(String name, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(name, style: const TextStyle(color: AppColors.gold, fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(color: AppColors.gold, fontSize: 14, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildAzkarCard(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AzkarDetailsScreen.routeName, arguments: title),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gold, width: 2),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.black.withOpacity(0.5)),
          child: Center(
            child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.gold, fontSize: 18, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}
