import 'package:demo/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navigation_search_bar.dart';
import 'side_bar_button.dart';

//Navigation bar
class NavBar extends StatelessWidget {
  NavBar({required this.triggerAnimation});
  final Function triggerAnimation;
  var photoURL = FirebaseAuth.instance.currentUser?.photoURL;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(triggerAnimation: triggerAnimation),
          //searchbar
          const Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchBar(),
            ),
          ),
          const SizedBox(width: 16.0),
          const Icon(Icons.notifications),
          const SizedBox(width: 16.0),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFFE7EEFB),
              child: (photoURL != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        '$photoURL',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ))
                  : Icon(Icons.person)),
              radius: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
