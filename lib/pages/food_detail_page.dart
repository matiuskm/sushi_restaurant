// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/theme/colors.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  // qty
  int qty = 0;

  // decrease qty
  void decQty() {
    setState(() {
      if (qty > 0) qty--;
    });
  }

  // increase qty
  void incQty() {
    setState(() {
      qty++;
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart id there is something in the cart
    if (qty > 0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, qty);
      // let the user know it was successful
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          "${widget.food.name} successfully added to cart.",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey[900],
        ),
        body: Column(
          children: [
            // listview of food detail
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView(
                  children: [
                    // image
                    Image.network(
                      widget.food.imagePath,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // rating
                    Row(
                      children: [
                        // star
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        // rating number
                        Text(
                          widget.food.rating,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // food name
                    Text(
                      widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // description
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.food.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // price + qty + add to cart button
            Container(
              color: primaryColor,
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // price + qty
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        widget.food.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      // qty
                      Row(
                        children: [
                          // minus button
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: decQty,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // qty count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                qty.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          // plus button
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: incQty,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  // add to cart button
                  MyButton(
                    text: "Add To Cart",
                    onTap: addToCart,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
