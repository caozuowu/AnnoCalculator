// ignore: file_names
import 'dart:convert';

import 'package:anno/model/Resident.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResidentView extends StatelessWidget {
  Resident data;
  ResidentView(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        width: 168,
        // height: 72,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Image.asset(
              data.path,
              width: 42,
              height: 42,
            ),
            const Flexible(
              child: TextField(),
            )
          ],
        ));
  }
}

class ResidentPage extends StatefulWidget {
  const ResidentPage({super.key});
  @override
  createState() => _ResidentPage();
}

class _ResidentPage extends State<ResidentPage> {
  late TextEditingController _controller;

  List<Resident> _residentList = [];
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadResource();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadResource() async {
    var jstring = await rootBundle.loadString("assets/resident.json");
    var data = jsonDecode(jstring);
    var list = <Resident>[];
    for (var instance in data) {
      list.add(Resident.fromJson(instance));
    }
    setState(() {
      _residentList = list;
    });
  }

  Widget _buildLeftList() {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: _residentList.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            return ResidentView(_residentList[i]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 84, 84, 84)),
        child: Column(
          children: [
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 35, 114, 225)),
              height: 128,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(107, 225, 219, 35)),
                    width: 168,
                    child: _buildLeftList(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 225, 127, 35)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
