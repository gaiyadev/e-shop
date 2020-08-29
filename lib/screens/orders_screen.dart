import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/orders_provider.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  // static final id = 'order_screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          orderData.orders[i],
        ),
      ),
    );
  }
}
