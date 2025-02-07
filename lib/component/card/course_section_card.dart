import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../model/courseSection.dart';

class CourseSectionCard extends StatelessWidget {
  CourseSectionCard({required this.courseSection});
  final CourseSection courseSection;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41),
          gradient: courseSection.background,
          boxShadow: [
            BoxShadow(
                color: courseSection.background.colors[0].withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 30.0),
            BoxShadow(
                color: courseSection.background.colors[1].withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 30.0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41.0),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${courseSection.illustration}',
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            courseSection.courseSubtitle,
                            style: kCardSubtitleStyle,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            courseSection.courseTitle,
                            style: kCardTitleStyle,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
