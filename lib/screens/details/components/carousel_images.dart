import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {

  final List<String> imagesListUrl;

  CarouselImages(this.imagesListUrl);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16/9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
       items: [
          Image(image: AssetImage(widget.imagesListUrl[0],),),
          Image(image: AssetImage(widget.imagesListUrl[1],),),
          Image(image: AssetImage(widget.imagesListUrl[2],),),
          Image(image: AssetImage(widget.imagesListUrl[3],),),
          Image(image: AssetImage(widget.imagesListUrl[4],),),
          Image(image: AssetImage(widget.imagesListUrl[5],),),
      ],
      ),
    );
  }
}
