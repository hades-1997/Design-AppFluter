import 'package:flutter/material.dart';
import 'package:food_ui/constants/colors.dart';

import '../../models/food.dart';
import 'food_quantity.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  const FoodDetail(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      color: kBackground,
      child: Column(children: [
        Text(
          food.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconText(
              Icons.access_time_outlined,
              Colors.blue,
              food.waitTime,
            ),
            _buildIconText(
              Icons.start_outlined,
              Colors.amber,
              food.score.toString(),
            ),
            _buildIconText(
              Icons.local_fire_department_outlined,
              Colors.red,
              food.cal,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        FoodQuantity(food),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              'Ingredients',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(children: [
                      Image.asset(food.ingredients[index].values.first),
                      Text(
                        food.ingredients[index].keys.first,
                      ),
                    ]),
                  )),
              separatorBuilder: (_, index) => SizedBox(
                    width: 15,
                  ),
              itemCount: food.ingredients.length),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: const [
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          food.about,
          style: const TextStyle(
            wordSpacing: 1.2,
            height: 1.5,
            fontSize: 16,
          ),
        )
      ]),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
