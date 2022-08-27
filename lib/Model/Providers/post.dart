import 'package:flutter/material.dart';

class PostItem with ChangeNotifier {
  final String id;
  final String title;
  final String description;

  PostItem({
    required this.id,
    required this.title,
    required this.description,
  });
}

class Entry with ChangeNotifier {
  final List<PostItem> _items = [];

  List<PostItem> get items {
    return [..._items];
  }

  void addNewPost(PostItem value) {
    _items.add(value);
    notifyListeners();
  }
}
