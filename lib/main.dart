import 'package:flutter/material.dart';
import 'package:messenger_ui/screen/index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Messenger',
      home: IndexScreen(),
    );
  }
}
