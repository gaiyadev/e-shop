import 'package:flutter/cupertino.dart';
import 'package:state_management/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'A Pane',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/stack-clothing-jeans-sweaters-on-600w-1268384791.jpg',
    ),
    Product(
      id: 'p6',
      title: 'shirt',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/stack-clothes-on-table-indoorhousehold-600w-695271853.jpg',
    ),
    Product(
      id: 'p7',
      title: 'jean',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/woman-trendy-fashion-clothes-collage-600w-523691986.jpg',
    ),
    Product(
      id: 'p8',
      title: 'gang',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/children-clothes-hanging-on-hangers-600w-455876137.jpg',
    ),
    Product(
      id: 'p9',
      title: 'wow',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/children-clothes-hanging-on-hangers-600w-455876137.jpg',
    ),
    Product(
      id: 'p10',
      title: 'est',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/children-clothes-hanging-on-hangers-600w-455876137.jpg',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((productItem) => productItem.isFavorite).toList();
    // }

    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final productIndex = _items.indexWhere((prodId) => prodId.id == id);
    if (productIndex >= 0) {
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      print(';;');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
