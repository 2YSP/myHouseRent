class InfoItem {
  final String title;

  final String imageUri;

  final String source;

  final String time;

  final String navigateUri;

  const InfoItem({required this.title,required this.imageUri, required this.source,
    required this.time,required this.navigateUri});
}

const List<InfoItem> infoData = [
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUri: 'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg',
      source: "新华网",
      time: "两天前",
      navigateUri: 'login'),
  const InfoItem(
      title: '置业选择 | 珠江新城 三室一厅 广州的隔江眺望',
      imageUri: 'https://tva1.sinaimg.cn/large/008i3skNgy1gsu64d1yyyj30ik0awabs.jpg',
      source: "新华网",
      time: "两天前",
      navigateUri: 'login'),
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUri: 'https://tva1.sinaimg.cn/large/008i3skNgy1gsu65bbztrj30ks0cugmw.jpg',
      source: "新华网",
      time: "两天前",
      navigateUri: 'login'),
];
