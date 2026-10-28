import 'package:flutter/material.dart';

class AzkarProvider extends ChangeNotifier {
  // استخدام Set يضمن عدم تكرار نفس الذكر مرتين ويجعل البحث أسرع
  Set<String> _favAzkar = {};

  List<String> get favAzkar => _favAzkar.toList();

  void toggleFavorite(String zekr) {
    String cleanZekr = zekr.trim();
    if (_favAzkar.contains(cleanZekr)) {
      _favAzkar.remove(cleanZekr);
    } else {
      _favAzkar.add(cleanZekr);
    }
    notifyListeners(); // إرسال إشعار لكل الشاشات لتحديث نفسها فوراً
  }

  bool isFavorite(String zekr) {
    return _favAzkar.contains(zekr.trim());
  }
}
