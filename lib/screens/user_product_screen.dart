import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/product_provider.dart';
import 'package:state_management/screens/edit_product_screen.dart';
import 'package:state_management/widgets/app_drawer.dart';
import 'package:state_management/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const id = 'user_product_screen';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.id);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: ListView.builder(
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  id: productData.items[i].id,
                  title: productData.items[i].title,
                  imageUrl: productData.items[i].imageUrl,
                ),
                Divider(),
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
