import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../model/completedCourse.dart';

class CompleteCourseCard extends StatelessWidget {
  CompleteCourseCard({required this.cardItems});
  final CompletedCourse cardItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(alignment: Alignment.topRight, children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 260,
            height: 140,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: cardItems.background.colors[0].withOpacity(0.3),
                      offset: Offset(0, 20),
                      blurRadius: 20.0),
                  BoxShadow(
                      color: cardItems.background.colors[1].withOpacity(0.3),
                      offset: Offset(0, 20),
                      blurRadius: 20.0)
                ],
                borderRadius: BorderRadius.circular(41),
                gradient: cardItems.background),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, top: 35.0, right: 32.0),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(41),
                child: Container(
                  height: 140.0,
                  width: 260.0,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: Expanded(
                            child: Image.asset(
                          'asset/illustrations/${cardItems.illustration}',
                          fit: BoxFit.cover,
                          height: 140,
                        )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardItems.courseSubtitle,
                                    style: ksubTitleStyle,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    cardItems.courseTitle,
                                    style: const TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                            width: 140.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Image.asset(
              'asset/icons/icon-play.png',
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
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
