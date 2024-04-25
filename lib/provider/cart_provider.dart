import 'package:delivery_025/constants/imports.dart';

import 'package:flutter/foundation.dart';

class CartPro extends ChangeNotifier {
  final List<dynamic> _cart = [];

  List<dynamic> get cart => _cart;

  int _qty = 1;

  int get qty => _qty;

  void clearQTY() {
    _qty = 0;
    notifyListeners();
  }

  void increment() {
    _qty++;
    notifyListeners();
  }

  void decrement() {
    if (_qty > 0) {
      _qty--;
    }
    notifyListeners();
  }


  void addToCart(dynamic food) {
    // Check if the food item already exists in the cart
    bool foundInCart = false;
    for (var item in _cart) {
      if (item.id == food.id) {
        // Assuming each item has a unique identifier like 'id'
        // If the item is already in the cart, update its quantity
        item.qty++;
        foundInCart = true;
        break;
      }
    }

    if (!foundInCart) {
      // If the item is not already in the cart, add it with quantity 1
      food.qty = 1;
      _cart.add(food);
    }
    notifyListeners();
  }

  void removeFromCart(dynamic food) {
    for (var item in _cart) {
      if (item.id == food.id) {
        // If the item is in the cart, decrement its quantity
        if (item.qty > 0) {
          item.qty--;
        }
        // You might want to remove the item from the cart if its quantity becomes zero
        if (item.qty == 0) {
          _cart.remove(item);
        }
        break;
      }
    }

    notifyListeners();
  }

/*  void clearCart() {
    _cart.clear();
    notifyListeners();
  }*/

  void deleteItem(dynamic food) {
    _cart.removeWhere((element) => element == food);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
