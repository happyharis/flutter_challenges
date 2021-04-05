import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final appBarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
          height: height,
        ),
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appBarHeight),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {},
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                  ],
                ),
                SizedBox(height: height * 0.1),
                Column(children: [
                  for (final buttonData in iconButtons) ...[
                    IconButton(icon: Icon(buttonData.icon), onPressed: () {}),
                    Text(buttonData.amount.toString()),
                    SizedBox(height: 10),
                  ]
                ]),
                Spacer(),
                ModelDescriptionBox(),
                SizedBox(height: bottomPadding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ModelDescriptionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: width * 0.9,
        padding: const EdgeInsets.all(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gal Gadot',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 10),
              Text(
                modelDescription,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 4,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red.shade700,
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: borderRadius),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 13)),
                    ),
                    onPressed: () {},
                    label: FilledCircleAddIcon(),
                    icon: Text('Follow'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilledCircleAddIcon extends StatelessWidget {
  const FilledCircleAddIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add,
        color: Colors.black,
        size: 15,
      ),
    );
  }
}

const modelDescription =
    'Gal Gadot-Varsano is an Israeli actress, producer, and model. At age 18, she was crowned Miss Israel 2004. She then served two years in the Israel Defense Forces as a soldier, after which she began studying at the IDC Herzliya college, while building her modelling and acting careers';

const imageUrl =
    'https://images.unsplash.com/photo-1615212863630-1691e4c99c15?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80';

class IconButtonData {
  final IconData? icon;
  final int? amount;

  IconButtonData({this.icon, this.amount});
}

final iconButtons = [
  IconButtonData(icon: Icons.comment, amount: 3),
  IconButtonData(icon: Icons.favorite_outline, amount: 579),
  IconButtonData(icon: Icons.remove_red_eye, amount: 18),
];

const borderRadius = BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
  bottomRight: Radius.circular(20),
);
