// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:harry_potter_api_app/helpers/constans.dart';
import 'package:harry_potter_api_app/models/character_api.dart';
import '';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
List<Character> _characters = [];

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Characters')
      ),
      body: _getBody(),
    );
  }

  _getBody() {}

  void _getCharacters() async{
    var url = Uri.parse(Constans.apiUrl);
    var response = await http.get(url);
  }
}



