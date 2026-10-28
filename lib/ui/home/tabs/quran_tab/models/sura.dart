/// A data model representing a single Sura (chapter) of the Holy Quran.
class Sura {
  /// The numeric order of the Sura in the Quran (1 to 114).
  int id;

  /// The transliterated English name of the Sura (e.g., "Al-Fatiha").
  String nameEn;

  /// The Arabic name of the Sura (e.g., "الفاتحه").
  String nameAr;

  /// The total number of verses (Ayat) in the Sura.
  /// Note: Stored as a String, but represents a numerical value.
  String versesNumber;

  /// Constructs a [Sura] instance. All fields are required.
  Sura({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.versesNumber,
  });
}

/// A fully populated list of [Sura] objects.
///
/// This list is generated dynamically by combining parallel arrays of
/// Arabic names, English names, and verse counts. The [id] is automatically
/// assigned based on the index (1-based).
List<Sura> suraList = List.generate(arabicAuranSuras.length, (index) {
  return Sura(
    id: index + 1,
    nameEn: englishQuranSurahs[index],
    nameAr: arabicAuranSuras[index],
    versesNumber: AyaNumber[index],
  );
});

/// A hardcoded list containing the Arabic names of all 114 Suras, ordered by their position in the Quran.
List<String> arabicAuranSuras = [
  "الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس",
  // ... (rest of your Arabic list remains the same)
  "المسد", "الإخلاص", "الفلق", "الناس"
];

/// A hardcoded list containing the English transliterated names of all 114 Suras, ordered by their position in the Quran.
List<String> englishQuranSurahs = [
  "Al-Fatiha", "Al-Baqarah", "Aal-E-Imran", "An-Nisa'", "Al-Ma'idah", "Al-An'am", "Al-A'raf", "Al-Anfal", "At-Tawbah", "Yunus",
  // ... (rest of your English list remains the same)
  "Al-Masad", "Al-Ikhlas", "Al-Falaq", "An-Nas"
];

/// A hardcoded list containing the total number of verses (Ayat) for each of the 114 Suras.
/// The index corresponds to the Sura's position in the Quran.
List<String> AyaNumber = [
  '7', '286', '200', '176', '120', '165', '206', '75', '129', '109',
  // ... (rest of your verse numbers remain the same)
  '5', '4', '5', '6'
];