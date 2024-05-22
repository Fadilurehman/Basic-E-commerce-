import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String _searchQuery = '';
  List<String> _categories = ['Category 1', 'Category 2', 'Category 3'];

  String get searchQuery => _searchQuery;
  List<String> get categories => _categories;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
