import 'dart:convert';

import 'package:anno/model/Resident.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResidentPage extends StatefulWidget {
  const ResidentPage({super.key});
  @override
  createState() => _ResidentPage();
}

class _ResidentPage extends State<ResidentPage> {
  List<Resident> _list = [];
  @override
  void initState() {
    super.initState();
    _loadResource();
  }

  void _loadResource() async {
    var jstring = await rootBundle.loadString("assets/resident.json");
    var data = jsonDecode(jstring);
    for (var instance in data) {
      _list.add(Resident.fromJson(instance));
    }
    //print(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(),
          ),
          Container(
              height: 128,
              // width: 100,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  border: Border(
                    top: BorderSide(width: 10.0, color: Color(0xFFFFFFFF)),
                    left: BorderSide(width: 10.0, color: Color(0xFFFFFFFF)),
                    right: BorderSide(width: 10.0, color: Color(0xFF000000)),
                    bottom: BorderSide(width: 10.0, color: Color(0xFF000000)),
                  )))
        ]));
  }
}
