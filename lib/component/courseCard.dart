import 'package:demo/constant.dart';
import 'package:demo/model/CardItems.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  CourseCard({required this.cardItems});
  final CardItems cardItems;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: cardItems.background.colors[0].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 30.0),
                BoxShadow(
                    color: cardItems.background.colors[1].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 30.0)
              ],
              borderRadius: BorderRadius.circular(41),
              gradient: cardItems.background),
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: cardItems.subTitle,
                      child: Text(
                        cardItems.subTitle,
                        style: ksubTitleStyle,
                      ),
                    ),
                    SizedBox(height: 10),
                    Hero(
                      tag: cardItems.title,
                      child: Text(
                        cardItems.title,
                        style: const TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Hero(
                  tag: cardItems.bgImage,
                  child: Image.asset(
                    'asset/illustrations/${cardItems.bgImage}',
                    fit: BoxFit.cover,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Hero(
            tag: cardItems.logoImage,
            child: Image.asset(
              'asset/logos/${cardItems.logoImage}',
            ),
          ),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 4),
                blurRadius: 16.0,
              )
            ],
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.white,
          ),
        ),
      )
    ]);
  }
}
