import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  final String id;
  final String name;
  final String userName;
  final String address;
  final String zipcode;

  UserData({
    required this.id,
    required this.name,
    required this.userName,
    required this.address,
    required this.zipcode,
  });
}

class NewCandidate with ChangeNotifier {
  List<UserData> _items = [
    UserData(
        id: '1',
        name: 'Leane Graham',
        userName: 'Bret',
        address: 'Victor Plains, Suite 879, Wisokyburgh',
        zipcode: '92988 - 3874'),
  ];

  List<UserData> get items {
    return [..._items];
  }

  void addNew(UserData value) {
    _items.add(value);
    notifyListeners();
  }
}
