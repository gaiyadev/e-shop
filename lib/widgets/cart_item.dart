import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    this.id,
    this.price,
    this.quantity,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                child: Text('NGN $price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: NGN ${price * quantity}'),
          trailing: Text('$quantity *'),
        ),
      ),
    );
  }
}
