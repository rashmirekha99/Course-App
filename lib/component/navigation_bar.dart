import 'package:flutter/material.dart';

import 'navigation_search_bar.dart';
import 'side_bar_button.dart';

//Navigation bar
class NavBar extends StatelessWidget {
  NavBar({required this.triggerAnimation});
  final Function triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          SidebarButton(triggerAnimation: triggerAnimation),
          //searchbar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchBar(),
            ),
          ),
          SizedBox(width: 16.0),
          Icon(Icons.notifications),
          SizedBox(width: 16.0),
          CircleAvatar(
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}
