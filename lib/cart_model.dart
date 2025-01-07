import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String image;
  final String price;
  final double rating;
  bool isSelected;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    this.isSelected = false,
  });
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void toggleItemSelection(int index, bool isSelected) {
    _cartItems[index].isSelected = isSelected;
    notifyListeners();
  }

  void toggleSelectAll(bool selectAll) {
    for (var item in _cartItems) {
      item.isSelected = selectAll;
    }
    notifyListeners();
  }
}
