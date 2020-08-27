import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/widgets/cart_item.dart' as ci;
import 'package:state_management/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const id = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    final cartTotal = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your carr'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'NGN ${cartTotal.totalAmount}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Order Now'),
                    textColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => ci.CartItem(
                          id: cartTotal.items.values.toList()[i].id,
                          productId: cartTotal.items.keys.toList()[i],
                          title: cartTotal.items.values.toList()[i].title,
                          quantity: cartTotal.items.values.toList()[i].quantity,
                          price: cartTotal.items.values.toList()[i].price),
                      itemCount: cartTotal.itemCount,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
