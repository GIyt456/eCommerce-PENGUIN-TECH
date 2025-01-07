import 'package:flutter/material.dart';
import 'package:mobile_programming/home_page_1.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Import the CartProvider
import 'checkout_page.dart';
import 'package:mobile_programming/profile/profile_page.dart';
import 'wishlist/wishlist_page.dart'; // Import CheckoutPage

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool selectAll = false;

  // Method to toggle the selection of all items
  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value!;
    });
    // Update the selection status of all items in the cart
    Provider.of<CartProvider>(context, listen: false)
        .toggleSelectAll(selectAll);
  }

  // Current index for BottomNavigationBar
  int _selectedIndex = 2; // Set the default index to 'Cart' (index 2)

  // List of pages to navigate to
  final List<Widget> _pages = [
    HomePage1(),
    WishlistPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the selected page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get cart items from the CartProvider
    final cartItems = Provider.of<CartProvider>(context).cartItems;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Back to the previous page
          },
        ),
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Select All Checkbox
            Row(
              children: [
                Checkbox(
                  value: selectAll,
                  onChanged: toggleSelectAll,
                ),
                Text('Select All'),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(
                    context,
                    cartItems[index], // Use the cart item from the provider
                    index,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Buy Button
            ElevatedButton(
              onPressed: () {
                // Navigate to CheckoutPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text('BUY'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF00B0CB), // Blue color for selected item
        unselectedItemColor: Colors.grey, // Grey color for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped, // Update selected index on tap
      ),
    );
  }

  Widget _buildCartItem(
      BuildContext context, CartItem cartItem, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cartItem.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.orange),
                          SizedBox(width: 4),
                          Text(
                            cartItem.rating.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Checkbox for selecting the item
                Checkbox(
                  value: cartItem.isSelected,
                  onChanged: (value) {
                    Provider.of<CartProvider>(context, listen: false)
                        .toggleItemSelection(index, value!);
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Order (1):',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  cartItem.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
