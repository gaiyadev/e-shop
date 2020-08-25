import 'package:flutter/material.dart';
import 'package:state_management/widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  // final List<Product> loadedProducts =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductGrid(),
    );
  }
}
