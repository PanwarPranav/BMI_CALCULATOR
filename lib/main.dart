import 'package:flutter/material.dart';
import 'input.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
      return MaterialApp(
        darkTheme: ThemeData.dark(),
        home: InputPage(),
      );
    }
  }





