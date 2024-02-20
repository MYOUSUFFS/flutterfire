import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/screen/utils/utils.dart';
import 'package:http/http.dart' as http;

class AuthController {
  AuthController({required this.context});
  final BuildContext context;

  Future<void> signInOnFlutter(String email) async {
    try {
      final sendData = jsonEncode({'email': email});
      debugPrint(sendData);
      // Make a secure HTTP call to your Node.js endpoint, transmitting credentials
      final response = await http.post(
        Uri.parse('http://192.168.0.109:3000/api/firebaseSignIn'),
        headers: {"Content-Type": "application/json"},
        body: sendData,
      );
      debugPrint(response.body);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        final idToken =
            jsonDecode(response.body); // Assuming body contains the ID token
        await FirebaseAuth.instance.signInWithCustomToken(idToken["token"]);
        // User is now signed in to Flutter!
      } else {
        // Handle sign-in errors from Node.js
        MyToast(context: context).show(response.body);
      }
    } on FirebaseAuthException catch (e) {
      // Handle other errors
      debugPrint(e.message);
      MyToast(context: context).show(e.message);
    }
  }

  Future<void> login(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber);
      // Successful login: Navigate to the home screen
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      MyToast(context: context).show(e.message);
    }
  }

  Future<void> emailLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // Successful login: Navigate to the home screen
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      MyToast(context: context).show(e.message);
    }
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Handle successful logout (e.g., navigate to the login screen)
    } on FirebaseAuthException catch (error) {
      // Handle logout errors
      MyToast(context: context).show(error.message);
    }
  }
}
