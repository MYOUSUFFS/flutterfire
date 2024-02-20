import 'package:flutter/material.dart';
import 'package:flutterfire/screen/utils/my_style.dart';

class MyLogin extends StatelessWidget {
  MyLogin({super.key});
  final _fKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: phone,
                  decoration:
                      MyStyle().myInputDecoration(lable: "Phone Number"),
                ),
                TextFormField(
                  controller: otp,
                  decoration: MyStyle().myInputDecoration(lable: "OTP"),
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyReg extends StatelessWidget {
  MyReg({super.key});
  final _fKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: MyStyle().myInputDecoration(lable: "Name"),
                ),
                TextFormField(
                  controller: phone,
                  decoration:
                      MyStyle().myInputDecoration(lable: "Phone Number"),
                ),
                TextFormField(
                  controller: email,
                  decoration: MyStyle().myInputDecoration(lable: "E-mail"),
                ),
                TextFormField(
                  controller: otp,
                  decoration: MyStyle().myInputDecoration(lable: "OTP"),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Registration")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
