import 'package:coffeeappui/util/coffe_types.dart';
import 'package:flutter/material.dart';

import '../util/coffee_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Late',
      false,
    ],
    [
      'Blac',
      false,
    ],
  ];

  // ignore: non_constant_identifier_names
  void CoffeeTypeSelect(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[index][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ]),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Finter the best coffee for you",
                style: TextStyle(fontSize: 36),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            //horizontal listview of coffee types
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        CoffeeTypeSelect(index);
                      },
                    );
                  }),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTitle(
                  coffeeImagePath: 'assets/images/coffe.webp',
                  coffeeName: "Capucino",
                  coffeePrice: "\$4.0",
                ),
                CoffeeTitle(
                  coffeeImagePath: 'assets/images/coffe.webp',
                  coffeeName: "Capucino",
                  coffeePrice: "\$4.0",
                ),
                CoffeeTitle(
                  coffeeImagePath: 'assets/images/coffe.webp',
                  coffeeName: "Capucino",
                  coffeePrice: "\$4.0",
                ),
                CoffeeTitle(
                  coffeeImagePath: 'assets/images/coffe.webp',
                  coffeeName: "Capucino",
                  coffeePrice: "\$4.0",
                )
              ],
            ))
          ],
        ));
  }
}
