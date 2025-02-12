import 'package:flutter/material.dart';
import '../component/list/course_section_list.dart';
import '../constant.dart';

class CourseSectionScreen extends StatelessWidget {
  const CourseSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            decoration: const BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Course Section",
                  style: kTitle2Style,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "12 Sections",
                  style: ksubTitleStyle,
                )
              ],
            ),
          ),

          // CourseSectionCard(courseSection: courseSections[0]),
          CourseSectionList(),
        ],
      ),
    );
  }
}
