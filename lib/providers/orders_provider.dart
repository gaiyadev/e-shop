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
  final String authToken;
  final String userId;
  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProduct, double total) async {
    final url =
        'https://e-store-3adcd.firebaseio.com/orders/$userId.json?auth=$authToken';
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

  Future<void> fetchOrders() async {
    final url =
        'https://e-store-3adcd.firebaseio.com/orders/$userId.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final List<OrderItem> loadedOrders = [];

      if (response.statusCode == 200) {
        final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
        if (extractedData == null) {
          return;
        }
        extractedData.forEach((orderId, orderData) {
          loadedOrders.add(
            OrderItem(
              id: orderId,
              amount: orderData['amount'],
              products: (orderData['products'] as List<dynamic>)
                  .map(
                    (item) => CartItem(
                      id: item['id'],
                      title: item['title'],
                      quantity: item['quantity'],
                      price: item['price'],
                    ),
                  )
                  .toList(),
              dateTime: DateTime.parse(orderData['dateTime']),
            ),
          );
        });
        _orders = loadedOrders;
        notifyListeners();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }
}
