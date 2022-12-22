import 'dart:ui';
import 'package:demo/component/courseCard.dart';
import 'package:demo/constant.dart';
import 'package:demo/model/CardItems.dart';
import 'package:demo/model/SidebarItem.dart';
import 'package:demo/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'component/list/course_list.dart';
import 'component/list/explore_course_list.dart';
import 'component/navigation_bar.dart';
import 'component/sidebarRow.dart';
import 'model/ExploreItems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
