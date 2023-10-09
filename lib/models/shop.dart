import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
      name: "Salmon Sashimi",
      price: "28.800",
      imagePath:
          "https://umamicart.com/cdn/shop/products/salmon-sashimi_2048x2048.png?v=1692355095",
      rating: "4.9",
      description:
          "Indulge in the simplicity and purity of our Salmon Sashimi, a masterpiece of Japanese cuisine. Immerse yourself in the delicate flavors and silky textures of thinly sliced, fresh salmon, expertly presented on a bed of ice. Each slice of salmon is a testament to its pristine quality, offering a buttery, melt-in-your-mouth experience that captivates the senses. Accompanied by subtle hints of wasabi and soy sauce, our Salmon Sashimi is a culinary journey that celebrates the essence of pure, unadulterated seafood, making it a must-try for sushi enthusiasts and seafood lovers alike.",
    ),

    // tuna
    Food(
      name: "Futomaki Tuna",
      price: "28.800",
      imagePath:
          "https://sapporost.com/wp-content/uploads/2014/06/195-thickbox_default-Futo-Maki-Atun.jpg",
      rating: "4.7",
      description:
          "Experience the exquisite taste of our Futomaki Tuna roll, a sushi delight that promises a burst of flavors in every bite. This generously sized sushi roll is expertly crafted, featuring succulent tuna, fresh avocado, crisp cucumber, and a touch of creamy Japanese mayonnaise, all enveloped in a layer of seasoned sushi rice and nori seaweed. The tuna's rich umami flavor, combined with the creaminess of avocado and the refreshing crunch of cucumber, creates a harmonious blend of textures and tastes. Whether you're a sushi aficionado or a newcomer, our Futomaki Tuna roll is a delightful journey into the world of Japanese culinary artistry.",
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // getters
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food food, int qty) {
    for (var i = 0; i < qty; i++) {
      _cart.add(food);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
