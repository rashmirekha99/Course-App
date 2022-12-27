import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../model/courseSection.dart';
import '../card/course_section_card.dart';

class CourseSectionList extends StatelessWidget {
  const CourseSectionList({Key? key}) : super(key: key);

  List<Widget> courseSectionWidgets() {
    List<Widget> cards = [];
    for (var course in courseSections) {
      cards.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: CourseSectionCard(courseSection: course),
        ),
      );
    }

    cards.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          "No more sections to view, look\nfor more in our courses",
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: courseSectionWidgets(),
      ),
    );
  }
}
