import 'package:movies_app/src/features/core/assest_manger/assest_manger.dart';

class OnboardingData {
  String imagePath;
  String title;
  String? description;
  bool isFirst;
  bool isSecond;
  bool isLast;
  OnboardingData({
    required this.imagePath,
    required this.title,
    this.description,
    this.isFirst = false,
    this.isSecond = false,
    this.isLast = false,
  });

  static List<OnboardingData> onboardingPages = [
    OnboardingData(
      imagePath: AssestManger.moviesPosters,
      title: 'Find Your Next\n Favorite Movie Here',
      description:
          'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      isFirst: true,
    ),
    OnboardingData(
      imagePath: AssestManger.avengers,
      title: 'Discover Movies',
      description:
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      isSecond: true,
    ),
    OnboardingData(
      imagePath: AssestManger.oppenheimer,
      title: 'Explore All Genres',
      description:
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    ),
    OnboardingData(
      imagePath: AssestManger.badBoys,
      title: 'Create Watchlists',
      description:
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    ),
    OnboardingData(
      imagePath: AssestManger.doctorStrange,
      title: 'Rate, Review, and Learn',
      description:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ),
    OnboardingData(
      imagePath: AssestManger.movie1917,
      title: 'Start Watching Now',
      isLast: true,
    ),
  ];
}
