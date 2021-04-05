import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;

  const DetailsPage({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 571 / 812 * height,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              width: width,
              height: 378 / 812 * height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.56),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
