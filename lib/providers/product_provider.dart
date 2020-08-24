import 'package:flutter/cupertino.dart';
import 'package:state_management/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
}
