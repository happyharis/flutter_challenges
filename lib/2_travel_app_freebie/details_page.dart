import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;

  const DetailsPage({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final imageHeight = 571 / 812 * height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imagePath,
            height: imageHeight,
          ),
          _LinearGradient(imageHeight: imageHeight, width: width),
          Positioned(
            top: 48.1,
            left: 20,
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          _DescriptionBox(width: width, height: height)
        ],
      ),
    );
  }
}

class _DescriptionBox extends StatelessWidget {
  const _DescriptionBox({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          width: width,
          height: 378 / 812 * height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.56),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.09),
                offset: Offset(0, -24),
                blurRadius: 47,
                spreadRadius: 0,
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jasper National Park',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Color.fromRGBO(51, 51, 51, 1)),
                ),
                SizedBox(height: 7.55),
                Text(
                  'Alberta, Canada',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Color.fromRGBO(51, 51, 51, 1)),
                ),
                SizedBox(height: 13.48),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac velit in nascetur pulvinar dignissim. Lectus elit odio hendrerit vel sed ',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color.fromRGBO(130, 130, 130, 1),
                      fontSize: 14,
                      height: 1.5),
                ),
                SizedBox(height: 16.48),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(47, 128, 237, 0.1),
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        '145 Restaurants',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 14),
                    Text(
                      '34 KM from here',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Book Flight for My Trip'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color.fromRGBO(47, 128, 237, 1),
                      padding: EdgeInsets.symmetric(vertical: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LinearGradient extends StatelessWidget {
  const _LinearGradient({
    Key? key,
    required this.imageHeight,
    required this.width,
  }) : super(key: key);

  final double imageHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -112.42,
      height: imageHeight + 112.42,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 0),
              Color.fromRGBO(255, 255, 255, 0),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            stops: [0, 0.39, 0.75, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
