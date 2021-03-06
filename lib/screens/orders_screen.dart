import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/orders_provider.dart' show Orders;
import 'package:state_management/widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const id = 'order_screen';

  // var _isLoading = false;
  // @override
  // void initState() {
  //   // Future.delayed(Duration.zero).then((_) async{
  //   _isLoading = true;

  //   Provider.of<Orders>(
  //     context,
  //     listen: false,
  //   ).fetchOrders().then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });

  //   // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  //Error handling stuff here
                  child: Center(
                    child: Text('An error occured'),
                  ),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, i) => OrderItem(
                      orderData.orders[i],
                    ),
                  ),
                );
              }
            }
          },
          future: Provider.of<Orders>(context, listen: false).fetchOrders(),
        ));
  }
}
