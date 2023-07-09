import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spydir/firebase_options.dart';
import 'package:spydir/screens/login_screen.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(252, 202, 70, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            centerTitle: true,
          )),
      home: const LogInScreen(),
    );
  }
}
