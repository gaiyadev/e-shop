import 'package:flutter/material.dart';
import 'package:state_management/screens/orders_screen.dart';
import 'package:state_management/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friemd'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                OrdersScreen.id,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('User Product'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                UserProductScreen.id,
              );
            },
          ),
        ],
      ),
    );
  }
}
