import 'package:flutter/material.dart';
import 'package:realestate_app/screens/home/HomePage.dart';

void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

