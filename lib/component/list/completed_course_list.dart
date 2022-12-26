import 'package:demo/model/completedCourse.dart';
import 'package:flutter/material.dart';
import '../card/completed_course_card.dart';


class CompletedCourseList extends StatefulWidget {
  const CompletedCourseList({Key? key}) : super(key: key);

  @override
  State<CompletedCourseList> createState() => _CompletedCourseListState();
}

class _CompletedCourseListState extends State<CompletedCourseList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: completedCourses.map(
        (e) {
          var index = completedCourses.indexOf(e);
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              width: 7.0,
              height: 7.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.blue : Colors.grey,
              ));
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                opacity: index == currentPage ? 1.0 : 0.7,
                child: CompleteCourseCard(
                  cardItems: completedCourses[index],
                ),
              );
            },
            itemCount: completedCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.80),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateIndicator()
      ],
    );
  }
}
