import 'package:flutter/material.dart';
import 'package:food_ui/detail/detail.dart';
import 'package:food_ui/models/restaurant.dart';

import 'food_item.dart';

class FoodListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Restaurant restaurant;

  const FoodListView(
      {super.key,
      required this.selected,
      required this.callback,
      required this.pageController,
      required this.restaurant,
      required PageController pagecontroller});

  @override
  Widget build(BuildContext context) {
    final category = restaurant.menu.keys.toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map((e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetaiPage(
                              restaurant.menu[category[selected]]![index])));
                    },
                    child: FoodItem(
                        food: restaurant.menu[category[selected]]![index]),
                  ),
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: restaurant.menu[category[selected]]!.length,
                ))
            .toList(),
      ),
    );
  }
}
