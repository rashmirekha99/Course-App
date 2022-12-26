import 'package:flutter/material.dart';
class CourseSection {
  CourseSection({
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

// Course Sections
var courseSections = [
  CourseSection(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "01 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'illustration-01.png',
  ),
  CourseSection(
    courseTitle: "Flutter for Designers",
    courseSubtitle: "02 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE477AE),
        Color(0xFFC54284),
      ],
    ),
    illustration: 'illustration-08.png',
  ),
  CourseSection(
    courseTitle: "ProtoPie Prototyping",
    courseSubtitle: "03 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFEA7E58),
        Color(0xFFCE4E27),
      ],
    ),
    illustration: 'illustration-09.png',
  ),
  CourseSection(
    courseTitle: "UI Design Course",
    courseSubtitle: "04 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF72CFD4),
        Color(0xFF42A0C2),
      ],
    ),
    illustration: 'illustration-10.png',
  ),
  CourseSection(
    courseTitle: "React for Designers",
    courseSubtitle: "05 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF2E56),
        Color(0xFFCB012B),
      ],
    ),
    illustration: 'illustration-11.png',
  ),
];
