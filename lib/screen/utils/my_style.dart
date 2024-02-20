import 'package:flutter/material.dart';

class MyStyle {
  InputDecoration myInputDecoration({String? lable}) => InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
