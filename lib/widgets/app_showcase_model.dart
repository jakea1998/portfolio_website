// A model that represents portfolio apps on landing page.
class ShowcaseAppModel {
  final String name;
  final String? appStoreURL;
  final String? playStoreURL;
  final String? githubURL;
  final String image;
  final String topic;

  const ShowcaseAppModel.withNetworkAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    required this.topic,
  }) : _isNetworkImage = true;

  const ShowcaseAppModel.withLocalAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    required this.topic,
  }) : _isNetworkImage = false;

  final bool _isNetworkImage;
  bool get isNetworkImage => _isNetworkImage;
}

// List of apps that will be listed on landing page.
const apps = [
  
  ShowcaseAppModel.withNetworkAsset(
    name: 'Bands Around The World',
    image: 'assets/images/bandsaroundtheworld.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.bandsaroundtheglobe.app',
    appStoreURL: 'https://apps.apple.com/us/app/bands-around-the-world/id1550872941',
    topic: 'Music',
  ),
  ShowcaseAppModel.withNetworkAsset(
    name: '1000 Hours Outside',
    image: 'assets/images/1000hoursoutside.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.onethousandhoursoutside.app&hl=en_US&gl=US&pli=1',
    appStoreURL: 'https://apps.apple.com/us/app/1000-hours-outside/id1568551599',
    topic: 'Outdoors',
  ),
  ShowcaseAppModel.withNetworkAsset(
    name: 'Golf Home Guru',
    image: 'assets/images/golfhomeguru.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.golfhomeguru.app',
    appStoreURL: 'https://apps.apple.com/us/app/golf-home-guru/id1525149083',
    topic: 'Real Estate',
  ),
  
];