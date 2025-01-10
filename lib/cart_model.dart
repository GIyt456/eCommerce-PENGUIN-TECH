import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String image;
  final String price;
  final double rating;
  int quantity; // Added quantity field, assuming the default quantity is 1

  bool isSelected;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    this.quantity = 1, // Default quantity is 1
    this.isSelected = false,
  });

  // Get the price as a double (parsed from the string price)
  double get parsedPrice {
    double itemPrice = 0.0;
    try {
      itemPrice = double.parse(price.replaceAll(RegExp(r'[^0-9.]'), ''));
    } catch (e) {
      print('Error parsing price for $title: $e');
    }
    return itemPrice;
  }
}


class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  // Add item to the cart
  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  // Toggle item selection
  void toggleItemSelection(int index, bool isSelected) {
    _cartItems[index].isSelected = isSelected;
    notifyListeners();
  }

  // Toggle selection of all items
  void toggleSelectAll(bool selectAll) {
    for (var item in _cartItems) {
      item.isSelected = selectAll;
    }
    notifyListeners();
  }

  // Get all selected items
  List<CartItem> get selectedItems {
    return cartItems.where((item) => item.isSelected).toList();
  }

  // Calculate total price of the selected items
  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in selectedItems) {
      // Multiply price by quantity
      total += item.parsedPrice * item.quantity; 
    }
    return total;
  }
}