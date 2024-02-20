import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key, this.name, this.phone, this.email});
  final String? name;
  final String? phone;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Text("$name"),
              Text("$phone"),
              Text("$email"),
            ],
          ),
        ),
      ),
    );
  }
}
