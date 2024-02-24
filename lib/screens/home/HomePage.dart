import 'package:flutter/material.dart';
import 'package:realestate_app/screens/home/components/categories.dart';
import '../details/components/bottom_buttons.dart';
import '../details/components/custom_app_bar.dart';
import 'components/houses.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Real Estate App',
          style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              CustomAppBar(),
              Categories(),
              Houses(),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}