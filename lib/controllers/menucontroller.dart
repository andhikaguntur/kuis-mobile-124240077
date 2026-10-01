import 'package:flutter/foundation.dart';

import '../models/data.dart';

class AppMenuController extends ChangeNotifier {
  final List<String> categories = const [
    'Semua',
    'T-Shirt',
    'Jacket',
    'Pants',
    'Bag',
    "Accessories",
  ];

  String selectedCategory = 'Semua';
  String searchQuery = '';
  final Set<int> favoriteIds = {};

  List<Product> get filteredCatalog {
    final query = searchQuery.toLowerCase();

    return catalog.where((menu) {
      final matchCategory =
          selectedCategory == 'Semua' || menu.type == selectedCategory;
      final matchSearch =
          query.isEmpty ||
          menu.productName.toLowerCase().contains(query) ||
          menu.type.toLowerCase().contains(query);

      return matchCategory && matchSearch;
    }).toList();
  }

  void setSearch(String value) {
    searchQuery = value;
    notifyListeners();
  }

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void toggleFavorite(int menuId) {
    if (favoriteIds.contains(menuId)) {
      favoriteIds.remove(menuId);
    } else {
      favoriteIds.add(menuId);
    }
    notifyListeners();
  }

  bool isFavorite(int menuId) {
    return favoriteIds.contains(menuId);
  }
}
