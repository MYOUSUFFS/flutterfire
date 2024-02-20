import 'package:flutter/material.dart';

class MyStyle {
  InputDecoration myInputDecoration({String? lable}) => InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
}

class MyToast {
  MyToast({required this.context});

  final BuildContext context;

  void show(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(minutes: 1),
      content: Text("$message"), // Display error message
    ));
  }
}
