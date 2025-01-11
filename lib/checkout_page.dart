import 'package:flutter/material.dart';
import 'cart_model.dart'; // Ensure this path is correct // Ensure this path is correct
import 'shipping_page.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem> selectedItems;

  CheckoutPage({required this.selectedItems});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String deliveryAddress = 'Jalan Veteran, No. 17, Jakarta Pusat, Indonesia';

  void _editAddress(BuildContext context) {
    TextEditingController addressController =
        TextEditingController(text: deliveryAddress);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Delivery Address'),
          content: TextField(
            controller: addressController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter new delivery address',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  deliveryAddress = addressController.text.trim();
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate shipping cost and total price
    double shippingCost = 15000.0;
    double totalPrice = widget.selectedItems.fold(
      0,
      (sum, item) =>
          sum +
          (item.parsedPrice * item.quantity) +
          (shippingCost * item.quantity),
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
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address Section
            Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      deliveryAddress,
                      style: TextStyle(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _editAddress(context);
                    },
                    icon: Icon(Icons.edit, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Shopping List Section
            Text(
              'Shopping List',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: widget.selectedItems.map((item) {
                return _buildShoppingItem(
                  item: item,
                  shippingCost: shippingCost,
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Shipping Cost Summary
            _buildSummaryRow(
              'Shipping Cost',
              'Rp ${(shippingCost * widget.selectedItems.fold(0, (sum, item) => sum + item.quantity)).toInt()}',
            ),

            // Total Price Summary
            _buildSummaryRow(
              'Total Price',
              'Rp ${totalPrice.toInt()}',
              isBold: true,
            ),

            // Proceed Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  double subtotal = widget.selectedItems.fold(
                    0,
                    (sum, item) => sum + (item.parsedPrice * item.quantity),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShippingPage(
                        selectedItems: widget.selectedItems,
                        subtotal: subtotal.toInt(),
                        shippingFee: (shippingCost *
                                widget.selectedItems.fold(
                                    0, (sum, item) => sum + item.quantity))
                            .toInt(),
                        totalPrice: totalPrice.toInt(), product: {},
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

  Widget _buildShoppingItem({
    required CartItem item,
    required double shippingCost,
  }) {
    double itemTotalPrice =
        item.parsedPrice * item.quantity + (shippingCost * item.quantity);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Variations: Some variation', // Customize as needed
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 5),
                    Text('${item.rating}'),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp ${item.parsedPrice.toInt()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 5),
              Text('Qty: ${item.quantity}'),
              SizedBox(height: 5),
              Text(
                'Shipping: Rp ${(shippingCost * item.quantity).toInt()}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'Total: Rp ${itemTotalPrice.toInt()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isBold = false, Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
