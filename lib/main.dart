import 'package:flutter/material.dart';
import 'package:starting_mobx/dice/dice_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobx Docs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DicePage(),
    );
  }
}
