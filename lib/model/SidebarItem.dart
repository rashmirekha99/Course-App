import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarItems {
  SidebarItems({
    required this.title,
    required this.background,
    required this.icon,
  });
  String title;
  LinearGradient background;
  Icon icon;
}

var sidebaritems = [
  SidebarItems(
    title: "Home",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ]),
    icon: const Icon(Icons.home, color: Colors.white),
  ),
  //2nd item
  SidebarItems(
    title: "Messages",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 106, 227, 148),
          Color.fromARGB(255, 12, 216, 22),
        ]),
    icon: const Icon(
      Icons.message,
      color: Colors.white,
    ),
  ),
  //3rd item
  SidebarItems(
    title: "Settings",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 17, 66, 151),
          Color.fromARGB(255, 23, 11, 161),
        ]),
    icon: const Icon(Icons.settings, color: Colors.white),
  ),
  //4th item
  SidebarItems(
    title: "Cart",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 203, 86, 65),
          Color.fromARGB(255, 133, 37, 5),
        ]),
    icon: const Icon(Icons.shopping_cart, color: Colors.white),
  ),
];
