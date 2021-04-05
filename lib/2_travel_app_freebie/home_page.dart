import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_challenges/2_travel_app_freebie/details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final cardHeight = (375 / 812) * height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: cardHeight + 100,
            child: Swiper(
              reverse: true,
              itemCount: 2,
              itemHeight: cardHeight,
              itemWidth: width,
              scrollDirection: Axis.vertical,
              layout: SwiperLayout.STACK,
              onTap: (index) {
                final imagePath = index.isEven ? jasper : canada;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(imagePath: imagePath);
                  },
                ));
              },
              itemBuilder: (context, index) {
                final imagePath = index.isEven ? jasper : canada;
                return ImageCard(
                  imagePath: imagePath,
                  cardHeight: cardHeight,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imagePath;
  final double cardHeight;
  const ImageCard({
    required this.imagePath,
    required this.cardHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            width: width,
          ),
        ),
        Positioned(
          top: -70,
          height: cardHeight + 70,
          width: width,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(51, 51, 51, 1),
                  Color.fromRGBO(51, 51, 51, 0),
                  Color.fromRGBO(51, 51, 51, 0),
                  Color.fromRGBO(51, 51, 51, .69),
                ],
                stops: [0.15, 0.28, 0.71, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Jasper National Park',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 6.5),
                Text(
                  'Alberta, Canada',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

final canada = 'lib/2_travel_app_freebie/images/canada.png';
final jasper = 'lib/2_travel_app_freebie/images/jasper_national_park.png';
