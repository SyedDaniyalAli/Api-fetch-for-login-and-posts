import 'package:flutter/material.dart';
import 'package:l0rem/Screens/tab_screen.dart';
import 'package:l0rem/widget/allpost.dart';
import 'package:l0rem/widget/auth_form.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
  ) async {
    bool? isAuth = await _authenticate(username: email, password: password);
    if (isAuth ?? false) {
      Navigator.of(context).pushNamed(TabsScreen.routeName);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Wrong Credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : AuthForm(_submitAuthForm),
    );
  }

  Future<bool?> _authenticate(
      {required String username, required String password}) async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var element in jsonResponse) {
        // print('Response get by Emmad: ${element['username']}');
        return (username == element['username'] &&
            password == element['username']);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
    return null;
  }
}
