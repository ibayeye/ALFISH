import 'package:alfish/core.dart';
import 'package:alfish/landingpage.dart';
import 'package:alfish/login.dart';
import 'package:alfish/mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginPage(),
    );
  }
}
