import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/controller/auth.dart';
import 'package:flutterfire/screen/auth/auth.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? name;
  String? phone;
  String? email;
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyEmailPassword(),
          ),
          (route) => false);
    } else {
      name = user.displayName;
      phone = user.phoneNumber;
      email = user.email;
    }
    super.initState();
  }

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
              ElevatedButton(
                onPressed: () {
                  AuthController(context: context).logout();
                },
                child: const Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
