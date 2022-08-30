// @dart=2.9

import 'package:anno/pages/MainPage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 2), () => "我是从互联网上获取的数据");
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
          future: mockNetworkData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Scaffold(body: MainPage());
            } else {
              return const Scaffold(body: MainPage());
            }
          },
        ));
  }
}
