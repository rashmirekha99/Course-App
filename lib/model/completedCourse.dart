import 'package:flutter/material.dart';

class CompletedCourse {
  CompletedCourse({
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

// Completed Courses
var completedCourses = [
  CompletedCourse(
    courseTitle: "Build an ARKit 2 App",
    courseSubtitle: "Certified",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF6B94),
        Color(0xFF6B2E98),
      ],
    ),
    illustration: 'illustration-12.png',
  ),
  CompletedCourse(
    courseTitle: "Swift Advanced",
    courseSubtitle: "Yet to be Certified",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFDEC8FA),
        Color(0xFF4A1B6D),
      ],
    ),
    illustration: 'illustration-13.png',
  ),
];
