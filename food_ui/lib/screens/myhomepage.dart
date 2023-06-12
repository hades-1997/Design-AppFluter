import 'package:flutter/material.dart';
import 'package:food_ui/models/restaurant.dart';
import 'package:food_ui/widgets/food_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../widgets/food_list_view.dart';
import '../widgets/restaurant_info.dart';
import '../widgets/custom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            leftIcon: Icons.arrow_back_ios_outlined,
            rightIcon: Icons.search_outlined,
          ),
          RestaurantInfo(),
          FoodList(
              selected: selected,
              callback: (int index) {
                setState(() {
                  selected = index;
                });
                pageController.jumpToPage(index);
              },
              restaurant: restaurant),
          Expanded(
              child: FoodListView(
            selected: selected,
            callback: (int index) {
              setState(() {
                selected = index;
              });
            },
            pagecontroller: pageController,
            restaurant: restaurant,
            pageController: pageController,
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                    width: 10,
                    height: 10,
                    color: kBackground,
                    borderRadius: BorderRadius.circular(10),
                    dotBorder: const DotBorder(
                        color: kPrimaryColor, padding: 2, width: 2)),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
