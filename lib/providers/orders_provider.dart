import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:state_management/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProduct, double total) async {
    const url = 'https://e-store-3adcd.firebaseio.com/orders.json';
    final timestamp = DateTime.now();

    final response = await http.post(url,
        body: jsonEncode({
          'amount': total,
          'products': cartProduct
              .map((e) => {
                    'id': e.id,
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price,
                  })
              .toList(),
          'dateTime': timestamp.toIso8601String(),
        }));
    if (response.statusCode >= 400) {
      print(response.statusCode);
    }
    _orders.insert(
      0,
      OrderItem(
        id: jsonDecode(response.body)['name'],
        amount: total,
        products: cartProduct,
        dateTime: timestamp,
      ),
    );
    notifyListeners();
  }
}
