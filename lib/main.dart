import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/auth_provider.dart';
import 'package:state_management/providers/cart.dart';
import 'package:state_management/providers/orders_provider.dart';
import 'package:state_management/providers/product_provider.dart';
import 'package:state_management/screens/4.1%20auth_screen.dart.dart';
import 'package:state_management/screens/Product_overview_screen.dart';
import 'package:state_management/screens/cart_screen.dart';
import 'package:state_management/screens/edit_product_screen.dart';
import 'package:state_management/screens/orders_screen.dart';
import 'package:state_management/screens/product_details_screen.dart';
import 'package:state_management/screens/user_product_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),
        ChangeNotifierProvider(create: (_) => Auth())
      ],
      child: MyApp(),
    ),
  );
}

//#0600FE
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
        routes: {
          ProductDetailScreen.id: (context) => ProductDetailScreen(),
          CartScreen.id: (context) => CartScreen(),
          OrdersScreen.id: (context) => OrdersScreen(),
          UserProductScreen.id: (context) => UserProductScreen(),
          EditProductScreen.id: (context) => EditProductScreen(),
          AuthScreen.id: (context) => AuthScreen(),
          ProductOverviewScreen.id: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
