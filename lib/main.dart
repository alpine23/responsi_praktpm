import 'package:flutter/material.dart';
import 'package:responsi_praktpm/views/menu_page.dart';

void main() {
  runApp(const MainApp());
  // Nama : Alfin Shalahuddin Ahmad
  // NIM  : 123210079
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi Prak TPM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MenuScreen(),
    );
  }
}
