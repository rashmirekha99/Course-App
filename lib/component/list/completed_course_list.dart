import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/model/completedCourse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../card/completed_course_card.dart';

class CompletedCourseList extends StatefulWidget {
  const CompletedCourseList({Key? key}) : super(key: key);

  @override
  State<CompletedCourseList> createState() => _CompletedCourseListState();
}

class _CompletedCourseListState extends State<CompletedCourseList> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  List<Container> indicators = [];
  int currentPage = 0;
  var completedCourses = [];
  @override
  void initState() {
    super.initState();
    getCompletedCourses();
  }

  void getCompletedCourses() {
    _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .get()
        .then((snapshot) {
      for (var course in snapshot.data()?['completed']) {
        print(course);
        _firestore
            .collection('courses')
            .doc(course)
            .get()
            .then((courseSnapshot) {
          setState(() {
            print(courseSnapshot["courseTitle"]);
            completedCourses.add(CompletedCourse(
                courseTitle: courseSnapshot["courseTitle"],
                courseSubtitle: courseSnapshot["courseSubtitle"],
                background: LinearGradient(colors: [
                  Color(
                    int.parse(courseSnapshot["color"][0]),
                  ),
                  Color(
                    int.parse(courseSnapshot["color"][1]),
                  ),
                ]),
                illustration: courseSnapshot["illustration"]));
          });
        });
      }
    });
  }

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
