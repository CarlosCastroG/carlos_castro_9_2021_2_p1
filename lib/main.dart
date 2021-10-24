// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:harry_potter_api_app/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter',
      home: MainScreen(),
    );
  }
}