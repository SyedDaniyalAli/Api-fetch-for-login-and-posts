// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/data.dart';
import 'package:l0rem/Model/Providers/post.dart';
import 'package:l0rem/Screens/login_screen.dart';
import 'package:l0rem/widget/allpost.dart';
import 'package:l0rem/widget/profile.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Entry(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewCandidate(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            backgroundColor: Colors.pink,
            accentColor: Colors.deepPurple,
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.pink,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            )),
        home: LoginScreen(),
      ),
    );
  }
}
