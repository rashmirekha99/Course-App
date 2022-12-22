import 'dart:ui';
import 'package:demo/component/courseCard.dart';
import 'package:demo/constant.dart';
import 'package:demo/model/CardItems.dart';
import 'package:demo/model/SidebarItem.dart';
import 'package:demo/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'component/list/course_list.dart';
import 'component/navigation_bar.dart';
import 'component/sidebarRow.dart';
import 'model/ExploreItems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            // color: Colors.black,
            color: kBackgroundColor,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavBar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recents",
                          style: kLargeTitleStyle,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "23 courses more coming",
                          style: ksubTitleStyle,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  CourseList(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 25.0, bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore",
                          style: kLargeTitleStyle,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  ExploreCourseList(),
                ],
              ),
            )),
      ),
    );
  }
}

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: exploreCourses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
                child: ExploreCourseCard(course: exploreCourses[index]),
              );
            }));
  }
}

class ExploreCourseCard extends StatelessWidget {
  ExploreCourseCard({required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(
            gradient: course.background,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 32.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.courseSubtitle, style: kCardSubtitleStyle),
                      SizedBox(height: 6),
                      Text(course.courseTitle, style: kCardTitleStyle),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                      height: 100.0,
                    )
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
