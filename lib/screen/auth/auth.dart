import 'package:flutter/material.dart';
import 'package:flutterfire/controller/auth.dart';
import 'package:flutterfire/screen/utils/utils.dart';

class MyLogin extends StatelessWidget {
  MyLogin({super.key});
  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration:
                      MyStyle().myInputDecoration(lable: "Phone Number"),
                ),
                TextFormField(
                  controller: otp,
                  decoration: MyStyle().myInputDecoration(lable: "OTP"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthController(context: context).login(phone.text);
                      }
                    },
                    child: const Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyEmailPassword extends StatelessWidget {
  MyEmailPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController(text: "test@ecfile.in");
  // final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: MyStyle().myInputDecoration(lable: "E-mail"),
                ),
                // TextFormField(
                //   controller: password,
                //   decoration: MyStyle().myInputDecoration(lable: "Password"),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthController(context: context)
                          .signInOnFlutter(email.text);
                    }
                  },
                  child: const Text("Email Login"),
                ),
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
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
