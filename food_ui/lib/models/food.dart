class Food {
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num score;
  String cal;
  num price;
  num quantity;
  List<Map<String, String>> ingredients;
  String about;
  bool highLight;

  Food(this.imgUrl, this.desc, this.name, this.waitTime, this.score, this.cal,
      this.price, this.quantity, this.ingredients, this.about,
      {this.highLight = false});

  static List<Food> generateRecommendFoods() {
    return [
      Food(
          "assets/images/food.png",
          'No1. in Sales',
          'Soba Soup',
          '50 p',
          4.8,
          '325 kcal',
          12,
          1,
          [
            {'Noodle': 'assets/images/ingre1.png'},
            {'Shrimp': 'assets/images/ingre2.png'},
            {'Egg': 'assets/images/ingre3.png'},
          ],
          'Simply put, ramen is a Japanese noodle soup'),
      Food(
          "assets/images/food.png",
          'No1. in Sales',
          'Soba Soup',
          '50 p',
          4.8,
          '325 kcal',
          12,
          1,
          [
            {'Noodle': 'assets/images/ingre1.png'},
            {'Shrimp': 'assets/images/ingre2.png'},
            {'Egg': 'assets/images/ingre3.png'},
          ],
          'Simply put, ramen is a Japanese noodle soup'),
      Food(
          "assets/images/food.png",
          'No1. in Sales',
          'Soba Soup',
          '50 p',
          4.8,
          '325 kcal',
          12,
          1,
          [
            {'Noodle': 'assets/images/ingre1.png'},
            {'Shrimp': 'assets/images/ingre2.png'},
            {'Egg': 'assets/images/ingre3.png'},
          ],
          'Simply put, ramen is a Japanese noodle soup'),
    ];
  }
}
