import 'package:flutter/material.dart';
import 'package:flutter_launcher/bag_screen.dart';
import 'package:flutter_launcher/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Main
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Smart Library',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: PageView(
          children: [MainScreen(), BagScreen()],
        ));
  }
}
