import 'package:flutter/material.dart';

class Course {
  Course({
    required this.courseTitle,
    required this.courseSubtitle,
    required this.background,
    required this.illustration,
  });

  String courseTitle;
  String courseSubtitle;
  LinearGradient background;
  String illustration;
}

var exploreCourses = [
  Course(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    illustration: 'illustration-04.png',
  ),
  Course(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    illustration: 'illustration-05.png',
  ),
];
