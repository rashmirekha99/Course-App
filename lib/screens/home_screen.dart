import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../component/list/course_list.dart';
import '../component/list/explore_course_list.dart';
import '../component/navigation_bar.dart';
import '../constant.dart';
import 'continue_watching_screen.dart';
import 'sidebar_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late Animation<double> animationOpacity;
  late AnimationController sidebarAnimationController;
  var sideBarHidden = true;

  @override
  void initState() {
    super.initState();
    //slide transition
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 250,
      ),
    );

    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));
    //fade transition
    animationOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: sidebarAnimationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavBar(triggerAnimation: () {
                      setState(() {
                        sideBarHidden = !sideBarHidden;
                      });
                      sidebarAnimationController.forward();
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Recents",
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(height: 6),
                          Text(
                            "23 courses more coming",
                            style: ksubTitleStyle,
                          ),
                          SizedBox(height: 20),
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
              ),
            ),
            ContinueWatchingScreen(),
            IgnorePointer(
              ignoring: sideBarHidden,
              child: Stack(children: [
                FadeTransition(
                  opacity: animationOpacity,
                  child: GestureDetector(
                    child: Container(
                      color: Color.fromRGBO(36, 38, 41, 0.4),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    onTap: () {
                      setState(() {
                        sideBarHidden = !sideBarHidden;
                      });
                      sidebarAnimationController.reverse();
                    },
                  ),
                ),
                SlideTransition(
                  position: sidebarAnimation,
                  child: SafeArea(
                    child: SideBar(),
                    bottom: false,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
