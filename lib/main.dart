import 'package:flutter/material.dart';
import 'package:home/autentikasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Autentikasi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
