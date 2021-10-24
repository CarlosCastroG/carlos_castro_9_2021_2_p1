import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:harry_potter_api_app/helpers/constans.dart';
import 'package:http/http.dart' as http;

import 'package:harry_potter_api_app/models/character_api.dart';
import 'package:harry_potter_api_app/screens/detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Character> results = [];

  @override
  void initState() {
    super.initState();
    _getApi();
  }

  Future _getApi() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {});
      await showAlertDialog(
          context: context,
          title: 'Tiene un Error!',
          message: 'Verifica que estes conectado a internet.',
          actions: <AlertDialogAction>[
            const AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    } else {
      var url =
          Uri.parse(Constans.apiUrl);
          Map<String, String> headers = {
          "Content-type": "application/json",
          "Accept": "application/json"
        };
      var response = await http.get(url, headers: headers);
      final decodeData = json.decode(response.body);

      if (decodeData['data'] != null && decodeData['data'].length > 0) {
        for (var i = 0; i < decodeData['data'].length; i++) {
          var image = decodeData['data'][i]['submission_url'];
          if (image.contains('jpg') ||
              image.contains('png') ||
              image.contains('gif')) {
            results.add(Character.fromJson(decodeData['data'][i]));
          }
        }

        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('Harrey Potter (personajes)',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: ListImage(results: results),
    );
  }
}

class ListImage extends StatelessWidget {
  final List<Character> results;

  const ListImage({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (_, i) {
          return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetails(character: results[i])));
                    },
                    child: Container(
                      width: double.infinity,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image: results[i].image,
                        fit: BoxFit.cover,
                        height: 200.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    results[i].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ));
        });
  }
}