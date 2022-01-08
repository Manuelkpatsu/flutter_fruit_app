import 'package:flutter/material.dart';

import 'theme/custom_color.dart';
import 'ui/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Fruit',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: CustomColor.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
