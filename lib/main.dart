import 'dart:ffi';

import 'package:anno/model/Resident.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      var file = "assets/data.xlsx";
      var bytes = File(file).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      var sheet = excel.tables["resident"];
      // var resident = Resident("famar", 0, [], "");
      // print(resident.type);
      // print(resident.capacity);
      // print(resident.consume);
      // print(resident.image);
      // print(sheet?.dict());
      // var rows = excel.tables["resident"]?.rows;

      // for (var row in excel.tables["resident"]?.rows ?? []) {
      //   print(row);
      // }

      // for (var table in excel.tables.keys) {
      //   print(table); //sheet Name
      //   print(excel.tables[table].maxCols);
      //   print(excel.tables[table].maxRows);
      //   for (var row in excel.tables[table].rows) {
      //     print("$row");
      //   }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You asdfsegs  sdfseg',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
