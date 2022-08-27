// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/data.dart';
import 'package:l0rem/Model/Providers/post.dart';
import 'package:l0rem/Screens/login_screen.dart';
import 'package:l0rem/Screens/tab_screen.dart';
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
            primaryColor: const Color(0xffE43228),
            backgroundColor: Colors.white,
            accentColor: const Color(0xffAF0917),
            accentColorBrightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              color: Color(0xffE43228),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE43228)),
              ),
            ),
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: const Color(0xffE43228),
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            )),
        routes: {
          '/': (ctx) => LoginScreen(),
          TabsScreen.routeName: (context) => TabsScreen(),
        },
      ),
    );
  }
}
