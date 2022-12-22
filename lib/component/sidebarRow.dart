import 'package:demo/constant.dart';
import 'package:flutter/material.dart';

import '../model/SidebarItem.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({required this.items});
  final SidebarItems items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 42.0,
            width: 42.0,
            child: items.icon,
            // color: kbuttonColor,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kbuttonColor,
                gradient: items.background)),
        const SizedBox(width: 12),
        Text(
          items.title,
          style: ktextStyle,
        ),
      ],
    );
  }
}
