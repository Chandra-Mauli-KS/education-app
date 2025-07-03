import 'package:flutter/material.dart';

import 'educational_main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EducationalMainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}