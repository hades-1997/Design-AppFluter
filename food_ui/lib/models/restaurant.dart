import 'food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logourl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant(this.name, this.waitTime, this.distance, this.label, this.logourl,
      this.desc, this.score, this.menu);

  static Restaurant generateRestaurant() {
    return Restaurant(
      'Restaurant',
      '20-30 min',
      '2.4km',
      'Restaurant',
      'assets/images/res_logo.png',
      'Orange sandwiches is delicious',
      4.7,
      {
        'REcommend': Food.generateRecommendFoods(),
        'Popular': Food.generateRecommendFoods(),
        'Noodeles': [],
        'Pizza': []
      },
    );
  }
}
