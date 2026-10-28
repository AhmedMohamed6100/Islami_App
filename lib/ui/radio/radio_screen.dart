import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // 1. استيراد حزمة الصوت
import 'package:islami_app/theme/colors.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedTabIndex = 0;

  final List<Map<String, String>> radios = [
    {
      'name': 'Radio Ibrahim Al-Akdar',
      'icon': 'assets/images/radio 1.png',
      'audio': 'audio/radio_1.mp3',
    },
    {
      'name': 'Radio Al-Qaria Yassen',
      'icon': 'assets/images/radio 2.png',
      'audio': 'audio/radio_2.mp3',
    },
    {
      'name': 'Radio Ahmed Al-trabulsi',
      'icon': 'assets/images/radio 1.png',
      'audio': 'audio/radio_3.mp3',
    },
    {
      'name': 'Radio Addokali Mohammad Alalim',
      'icon': 'assets/images/radio 1.png',
      'audio': 'audio/radio_4.mp3',
    },
  ];

  late AudioPlayer audioPlayer;
  int? playingIndex;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.stopped || state == PlayerState.completed) {
        setState(() {
          playingIndex = null;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void togglePlay(String audioPath, int index) async {
    try {
      if (playingIndex == index) {
        await audioPlayer.pause();
        setState(() {
          playingIndex = null;
        });
      } else {
        await audioPlayer.stop();
        await audioPlayer.play(AssetSource(audioPath));
        await audioPlayer.setVolume(1.0);

        setState(() {
          playingIndex = index;
        });
      }
    } catch (e) {
      print("Error playing radio: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background _radio.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/img_header.png"),
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 0
                            ? AppColors.gold
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.gold,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Radio',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedTabIndex == 0
                              ? AppColors.black
                              : AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 1
                            ? AppColors.gold
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.gold,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Reciters',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedTabIndex == 1
                              ? AppColors.black
                              : AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Radio List
          Expanded(
            child: ListView.builder(
              itemCount: radios.length,
              itemBuilder: (context, index) {
                final isThisPlaying = playingIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Image
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(radios[index]['icon']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Name
                        Text(
                          radios[index]['name']!,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        // Controls
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                isThisPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: AppColors.black,
                                size: 32,
                              ),
                              onPressed: () {
                                togglePlay(radios[index]['audio']!, index);
                              },
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(
                                Icons.volume_up,
                                color: AppColors.black,
                                size: 28,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}