import 'package:flutter/material.dart';

class CardItems {
  CardItems(
      {required this.subTitle,
      required this.title,
      required this.background,
      required this.bgImage,
      required this.logoImage});
  String subTitle;
  String title;
  LinearGradient background;
  String bgImage;
  String logoImage;
}

var cardItems = [
  CardItems(
    subTitle: "12 Sections",
    title: "Flutter for Designer",
    background: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ]),
    bgImage: "illustration-01.png",
    logoImage: "flutter-logo.png",
  ),
  CardItems(
    subTitle: "10 Sections",
    title: "Prototyping with ProtoPie",
    background: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 231, 141, 111),
          Color.fromARGB(255, 196, 28, 28),
        ]),
    bgImage: "illustration-02.png",
    logoImage: "protopie-logo.png",
  ),
  CardItems(
    subTitle: "22 Sections",
    title: "Build an app with SwiftUi",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 45, 45, 221),
          Color.fromARGB(255, 22, 9, 143),
        ]),
    bgImage: "illustration-03.png",
    logoImage: "swift-logo.png",
  ),
  CardItems(
    subTitle: "12 Sections",
    title: "Flutter for Designer",
    background: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ]),
    bgImage: "illustration-01.png",
    logoImage: "flutter-logo.png",
  ),
];
