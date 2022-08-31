// ignore: file_names
import 'package:anno/model/JsonData.dart';
import 'package:anno/model/Resident.dart';
import 'package:anno/views/ProductItemView.dart';
import 'package:anno/views/ResidentView.dart';
import 'package:flutter/material.dart';

import '../model/Product.dart';

// ignore: must_be_immutable
class ResidentPage extends StatefulWidget {
  const ResidentPage({super.key});
  @override
  createState() => _ResidentPage();
}

class _ResidentPage extends State<ResidentPage> {
  late TextEditingController _controller;

  List<Resident> _residentList = [];
  List<Product> _productList = [];

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

  void _loadResource() {
    var jsonData = JsonData.shareInstance();
    var data = jsonData.get("assets/resident.json");
    var list = <Resident>[];
    for (var row in data) {
      list.add(Resident.fromJson(row));
    }
    setState(() {
      _residentList = list;
    });
  }

  void _reloadProduct() {
    var productKeys = [];
    Map<String, Product> productMap = {};
    for (var resident in _residentList) {
      if (resident.amount > 0) {
        productKeys += resident.necessity + resident.luxary + resident.skyscraper;
      }
    }
    for (var key in productKeys) {
      if (!productMap.containsKey(key)) {
        productMap[key] = Product.fromJson(JsonData.shareInstance().get("assets/product.json")[key]);
      }
      // to du calcural
    }
    setState(() {
      _productList = productMap.values.toList();
    });

  }

  Widget _buildLeftList() {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: _residentList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return ResidentView(_residentList[i], onSubmitted: (value) {
            // reload product 
            // print("reload product");
            _reloadProduct();
          });
        }
      )
    );
  }

  Widget _buildRightList() {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: _productList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return ProductItemView(_productList[i]);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(104, 89, 89, 89)),
        child: Column(
          children: [
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 35, 114, 225)),
              height: 136,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(107, 225, 219, 35)),
                    width: 128,
                    child: _buildLeftList(),
                  ),
                  Expanded(
                    flex: 2,
                    child: _buildRightList(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
