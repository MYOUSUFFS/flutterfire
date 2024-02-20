import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/screen/auth/auth.dart';

import 'firebase_options.dart';
import 'screen/myhome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AppPath(),
    );
  }
}

bool isAuth = false;

class AppPath extends StatelessWidget {
  const AppPath({super.key});

  @override
  Widget build(BuildContext context) {
    if (!isAuth) {
      return MyLogin();
    } else {
      return const MyHome();
    }
  }
}
