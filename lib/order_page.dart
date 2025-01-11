import 'package:flutter/material.dart';
import 'shipping_page.dart'; // Pastikan path ini benar
import 'cart_model.dart'; // Pastikan path ini benar

class OrderPage extends StatelessWidget {
  final Map<String, String> product;

  OrderPage({required this.product});

  @override
  Widget build(BuildContext context) {
    // Konversi harga barang ke angka
    int productPrice = int.parse(product['price']!.replaceAll('Rp ', '').replaceAll('.', ''));
    int shippingCost = 15000; // Biaya pengiriman tetap
    int total = productPrice + shippingCost; // Hitung total

    CartItem cartItem = CartItem(
      title: product['title']!,
      image: product['image']!,
      price: product['price']!,
      rating: 4.5,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Shopping Bag',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Order',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildOrderItem(
              context,
              title: product['title']!,
              price: product['price']!,
              image: product['image']!,
              quantity: 1,
            ),
            SizedBox(height: 20),
            _buildSummaryRow('Subtotal', product['price']!),
            _buildSummaryRow('Shipping', 'Rp 15.000'),
            Divider(),
            _buildSummaryRow(
              'Total',
              'Rp ${_formatCurrency(total)}',
              isBold: true,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShippingPage(
                        selectedItems: [cartItem],
                        subtotal: productPrice,
                        shippingFee: shippingCost,
                        totalPrice: total, product: {},
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Proceed to Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(
    BuildContext context, {
    required String title,
    required String price,
    required String image,
    required int quantity,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(int value) {
    return value.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }
}
