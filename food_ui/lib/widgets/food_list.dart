import 'package:flutter/material.dart';
import 'package:food_ui/constants/colors.dart';
import 'package:food_ui/models/restaurant.dart';

class FoodList extends StatelessWidget {
  final int selected;
  final Function callback;
  final Restaurant restaurant;

  const FoodList(
      {super.key,
      required this.selected,
      required this.callback,
      required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final category = restaurant.menu.keys.toList();
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => GestureDetector(
                onTap: () => callback(index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  decoration: BoxDecoration(
                    color: selected == index ? kPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          separatorBuilder: (_, index) => const SizedBox(
                width: 20,
              ),
          itemCount: category.length),
    );
  }
}
