// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Characters')
      ),
      body: _getBody(),
    );
  }
}

Widget _getBody() {
  return Center(
    child: Text('hola'),
  );
}