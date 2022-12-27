import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import '../../model/CardItems.dart';
import '../../screens/course_screen.dart';
import '../courseCard.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  // List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cardItems.map(
        (e) {
          var index = cardItems.indexOf(e);
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
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
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CourseScreen(course: cardItems[index]),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Opacity(
                  opacity: currentPage == index ? 1.0 : 0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CourseCard(
                      cardItems: cardItems[index],
                    ),
                  ),
                ),
              );
            },
            itemCount: cardItems.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.67),
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
