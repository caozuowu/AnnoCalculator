// @dart=2.9

import 'package:anno/pages/LoadingPage.dart';
import 'package:anno/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'model/JsonData.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  Future<String> _calculation() async {
    await JsonData.load();
    return "Data Loaded";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: FutureBuilder(
          future: _calculation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Scaffold(body: MainPage());
            } else {
              return const Scaffold(body: LoadingPage());
            }
          },
        ));
  }
}
