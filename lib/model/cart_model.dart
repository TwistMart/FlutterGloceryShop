import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // itemName, itemPrice, imagePath, color
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "3.50", "lib/images/chicken.png", Colors.brown],
    ["Water", "3.00", "lib/images/water.png", Colors.blue],
  ];

  get shopItems => _shopItems;

  // list of cart items
  final List _cartItems = [];

  get cartItems => _cartItems;

  //add items to the cart
  void addItemTocart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners(); // providers notifies the listener , hence other widgets to update the data
  }

  // remove items from the cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculating the total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
