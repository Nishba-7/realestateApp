import 'package:flutter/material.dart';
import '../../model/house.dart';
import '../home/components/bottom_button.dart';
import '../home/components/custom_app_bar.dart';
import 'components/carousel_images.dart';
import 'components/house_details.dart';

class DetailsScreen extends StatefulWidget {

  final House house;

  const DetailsScreen({required Key key, required this.house}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back arrow is pressed
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.house.moreImagesUrl),
                  CustomAppBar(),
                ],
              ),
              HouseDetails(widget.house),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}
