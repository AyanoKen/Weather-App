import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        appBarTheme: ThemeData()
            .appBarTheme
            .copyWith(backgroundColor: Color.fromRGBO(255, 116, 134, 1.0)),
      ),
      home: LoadingScreen(),
    );
  }
}
