import 'package:flutter/material.dart';

import 'count_state_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigation(),
    );
  }
}
