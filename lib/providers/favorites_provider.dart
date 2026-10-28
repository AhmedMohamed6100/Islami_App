import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/models/sura.dart';

class FavoritesProvider extends ChangeNotifier {
  static final FavoritesProvider _instance = FavoritesProvider._internal();
  factory FavoritesProvider() => _instance;
  FavoritesProvider._internal();

  final List<Sura> _favSuras = [];
  final List<Hadeth> _favHadeths = [];
  final List<String> _favAzkar = [];

  List<Sura> get favSuras => _favSuras;
  List<Hadeth> get favHadeths => _favHadeths;
  List<String> get favAzkar => _favAzkar;

  void toggleSura(Sura sura) {
    if (_favSuras.any((s) => s.id == sura.id)) {
      _favSuras.removeWhere((s) => s.id == sura.id);
    } else {
      _favSuras.add(sura);
    }
    notifyListeners();
  }

  bool isSuraFav(int id) => _favSuras.any((s) => s.id == id);

  void toggleHadeth(Hadeth hadeth) {
    if (_favHadeths.any((h) => h.id == hadeth.id)) {
      _favHadeths.removeWhere((h) => h.id == hadeth.id);
    } else {
      _favHadeths.add(hadeth);
    }
    notifyListeners();
  }

  bool isHadethFav(int id) => _favHadeths.any((h) => h.id == id);

  void toggleZekr(String zekr) {
    if (_favAzkar.contains(zekr)) {
      _favAzkar.remove(zekr);
    } else {
      _favAzkar.add(zekr);
    }
    notifyListeners();
  }

  bool isZekrFav(String zekr) => _favAzkar.contains(zekr);
}
