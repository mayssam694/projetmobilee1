
import 'package:flutter/material.dart';
import 'OrderTracking.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cart is empty!"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lorsque l'utilisateur clique sur ce bouton, on redirige vers la page OrderDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderTracking()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text('Go to Order Details'),
            ),
          ],
        ),
      ),
    );
  }
}


