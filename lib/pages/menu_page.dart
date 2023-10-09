import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/components/food_tile.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/pages/food_detail_page.dart';
import 'package:sushi_restaurant/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    // get the shop and it'e menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    // navigate to food item details page

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it'e menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text("Tokyo"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // redeem button
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),

                // image
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/7499/7499409.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here...",
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/images/salmon_eggs.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),

                        // price
                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),

                // heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
