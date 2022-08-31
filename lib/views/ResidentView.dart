

import 'package:anno/model/Resident.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

// ignore: must_be_immutable
class ResidentView extends StatelessWidget {
  final Resident _data;
  ValueChanged<Resident>? _onSubmitted;
  // ignore: empty_constructor_bodies
  ResidentView(this._data,{super.key, ValueChanged<Resident>? onSubmitted}) {
    _onSubmitted = onSubmitted;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        width: 136,
        // height: 42,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              _data.path,
              width: 36,
              height: 36,
            ),
            Flexible(
              child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
                onChanged: (value) {
                  _data.amount = int.tryParse(value) ?? 0;
                  var callback = _onSubmitted ?? (value) => {};
                  callback(_data);
                },
              ),
            )
          ],
        ));
  }
}