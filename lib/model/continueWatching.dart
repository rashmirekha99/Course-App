import 'package:flutter/material.dart';

class ContinueWatching {
  ContinueWatching({
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

var continueWatchingCourses = [
  ContinueWatching(
    courseTitle: "React for Designers",
    courseSubtitle: "SVG Animations",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    illustration: 'illustration-06.png',
  ),
  ContinueWatching(
    courseTitle: "Animating in Principle",
    courseSubtitle: "Multiple Scrolling",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
    illustration: 'illustration-07.png',
  ),
];
