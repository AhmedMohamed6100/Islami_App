class OnBoardingModel {
  final String image ;
  final String title ;
  final String? description ;

  OnBoardingModel({
    required this.image,
    required this.title,
    this.description ,
});
  static List<OnBoardingModel> onboardingDate = [
    OnBoardingModel(
        image: "assets/images/on boarding 1.png",
        title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
        image: "assets/images/on boarding 2.png",
        title: "Welcome To Islami",
        description: "We Are Very Excited To Have You In Our Community"
    ),
    OnBoardingModel(
        image: "assets/images/on boarding 3.png",
        title: "Reading the Quran",
        description: "Read, and your Lord is the Most Generous"
    ),
    OnBoardingModel(
        image: "assets/images/on boarding 4.png",
        title: "Bearish",
        description: "Praise the name of your Lord, the Most High"
    ),
    OnBoardingModel(
        image: "assets/images/on boarding 5.png",
        title: "Holy Quran Radio",
        description: "You can listen to the Holy Quran Radio through the application for free and easily"
    ),
  ];
}