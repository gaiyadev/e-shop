import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/auth_provider.dart';
import 'package:state_management/providers/cart.dart';
import 'package:state_management/providers/orders_provider.dart';
import 'package:state_management/providers/product_provider.dart';
import 'package:state_management/screens/auth_screen.dart';
import 'package:state_management/screens/Product_overview_screen.dart';
import 'package:state_management/screens/cart_screen.dart';
import 'package:state_management/screens/edit_product_screen.dart';
import 'package:state_management/screens/orders_screen.dart';
import 'package:state_management/screens/product_details_screen.dart';
import 'package:state_management/screens/splash_screen.dart.dart';
import 'package:state_management/screens/user_product_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (null),
          update: (_, auth, prevState) => Products(
            auth.token,
            auth.userId,
            prevState == null ? [] : prevState.items,
          ),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: null,
          update: (_, auth, preState) => Orders(
            auth.token,
            auth.userId,
            preState == null ? [] : preState.orders,
          ),
        ),
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
      builder: (ctx, auth, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: auth.isAuth
            ? ProductOverviewScreen()
            : FutureBuilder(
                future: auth.tryAutoLogin(),
                builder: (ctx, authResult) =>
                    authResult.connectionState == ConnectionState.waiting
                        ? SplashScreen()
                        : AuthScreen(),
              ),
        routes: {
          ProductDetailScreen.id: (context) => ProductDetailScreen(),
          CartScreen.id: (context) => CartScreen(),
          OrdersScreen.id: (context) => OrdersScreen(),
          UserProductScreen.id: (context) => UserProductScreen(),
          EditProductScreen.id: (context) => EditProductScreen(),
          // AuthScreen.id: (context) => AuthScreen(),
          ProductOverviewScreen.id: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
