import 'package:flutter/material.dart';
import 'package:home/account/authProvider.dart';
import 'package:home/home.dart';
import 'package:provider/provider.dart';
import 'account/autentikasi.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Saya',
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const Autentikasi(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}