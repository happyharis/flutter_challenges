import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

const iconsPath = 'lib/3_ios_insta_profile/assets/icons/';
const imagePath = 'lib/3_ios_insta_profile/assets/images/';

class InstaProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
      scale: 1,
      assetPath: imagePath + 'profile_light.jpeg',
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'pieroborgo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(Size(21.5, 21.5)),
                      onPressed: () {},
                      icon: Image.asset(iconsPath + 'new-video.png'),
                    ),
                    SizedBox(width: 30.5),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(Size(20.5, 20.5)),
                      onPressed: () {},
                      icon: Image.asset(iconsPath + 'menu.png'),
                    ),
                  ],
                ),
                SizedBox(height: 11),
                ProfileStatsResponsive(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(imagePath + 'avatar.png', height: 86),
        for (var stats in userStats)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                stats.value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                ),
              ),
              Text(
                stats.name,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          )
      ],
    );
  }
}

class ProfileStatsResponsive extends StatelessWidget {
  const ProfileStatsResponsive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(imagePath + 'avatar.png', height: 86),
        for (var stats in userStats) ...[
          SizedBox(width: width * stats.leftSpaceFactor),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                stats.value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                ),
              ),
              Text(
                stats.name,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          )
        ]
      ],
    );
  }
}

class UserStats {
  final int value;
  final String name;

  /// Space on the left according to the percentage of width
  /// ```dart
  /// final width = MediaQuery.of(context).size.width;
  /// ...
  /// SizedBox(width: stats.leftSpaceFactor* witdth)
  /// ```
  final double leftSpaceFactor;

  UserStats({
    required this.value,
    required this.name,
    required this.leftSpaceFactor,
  });
}

final userStats = [
  UserStats(value: 210, name: 'post', leftSpaceFactor: 41 / 375),
  UserStats(value: 600, name: 'follower', leftSpaceFactor: 41 / 375),
  UserStats(value: 500, name: 'following', leftSpaceFactor: 24 / 375),
];
