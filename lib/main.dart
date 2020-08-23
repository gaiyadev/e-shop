import 'package:flutter/material.dart';
import 'package:state_management/screens/Product_overview_screen.dart';
import 'package:state_management/screens/product_details_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
      routes: {
        ProductDetailScreen.id: (context) => ProductDetailScreen(),
      },
    );
  }
}
