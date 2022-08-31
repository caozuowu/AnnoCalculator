
import 'package:anno/model/Product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductItemView extends StatelessWidget {
  final Product _data;
  ValueChanged<Product>? _onSubmitted;
  // ignore: empty_constructor_bodies
  ProductItemView(this._data,{super.key, ValueChanged<Product>? onSubmitted}) {
    _onSubmitted = onSubmitted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        // width: 160,
        height: 60,
        decoration: const BoxDecoration(
            color: Color.fromARGB(101, 144, 77, 9),
            border: Border(
            top: BorderSide(color: Color.fromARGB(255, 25, 2, 65), width: 1),
            left: BorderSide(color: Color.fromARGB(255, 25, 2, 65),  width: 2),
            right: BorderSide(color: Color.fromARGB(255, 25, 2, 65), width: 2),
            bottom: BorderSide(color: Color.fromARGB(255, 25, 2, 65), width: 1),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              _data.path,
              width: 32,
              height: 32,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("pre min", style: TextStyle(fontSize: 12)),
                  Text("12", style: TextStyle(fontSize: 12))
              ]),
            )
            // Flexible(
            //   child: TextField(
            //     keyboardType: TextInputType.number,
            //     decoration: const InputDecoration(
            //       border: InputBorder.none
            //     ),
            //     onChanged: (value) {
            //       _data.amount = int.parse(value); 
            //       var callback = _onSubmitted ?? (value) => {};
            //       callback(_data);
            //     },
            //   ),
            // )
          ],
        ));
  }
}