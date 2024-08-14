import 'package:flutter/material.dart';
import 'package:final_finetech/screens/home/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final E-commerce',
      theme: AppTheme.lightTheme(context),
      home: const HomeScreen(),
    );
  }
}
