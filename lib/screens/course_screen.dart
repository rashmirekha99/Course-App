import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../constant.dart';
import '../model/CardItems.dart';
import 'course_section_screen.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({required this.course});
  final CardItems course;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget indicators() {
    List<Widget> indicators = [];
    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
          width: 7.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == 0 ? Color(0xFF0971FE) : Color(0xFFA6AEBD))));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  late PanelController panelcontroller;

  @override
  void initState() {
    super.initState();
    panelcontroller = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SlidingUpPanel(
          color: kCardPopupBackgroundColor,
          controller: panelcontroller,
          backdropEnabled: true,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(34.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, -12),
              blurRadius: 32.0,
            )
          ],
          minHeight: 0.0,
          maxHeight: MediaQuery.of(context).size.height * 0.95,
          panel: CourseSectionScreen(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration:
                            BoxDecoration(gradient: widget.course.background),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: Hero(
                                          tag: widget.course.logoImage,
                                          child: Image.asset(
                                              'asset/logos/${widget.course.logoImage}'),
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: widget.course.subTitle,
                                            child: Text(widget.course.subTitle,
                                                style:
                                                    kSecondaryCalloutLabelStyle
                                                        .copyWith(
                                                            color: Colors
                                                                .white70)),
                                          ),
                                          Hero(
                                            tag: widget.course.title,
                                            child: Text(widget.course.title,
                                                style:
                                                    kLargeTitleStyle.copyWith(
                                                        color: Colors.white)),
                                          ),
                                        ],
                                      )),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: kPrimaryLabelColor
                                                    .withOpacity(0.8)),
                                            child: Icon(Icons.close,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 28,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Hero(
                                    tag: widget.course.bgImage,
                                    child: Image.asset(
                                      'asset/illustrations/${widget.course.bgImage}',
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28),
                      child: Container(
                        child: Image.asset('asset/icons/icon-play.png'),
                        width: 60.0,
                        height: 60.0,
                        padding: EdgeInsets.only(
                          top: 12.5,
                          bottom: 13.5,
                          left: 20.5,
                          right: 14.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: kShadowColor,
                              blurRadius: 16,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    left: 28.0,
                    right: 28.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.white,
                                  ),
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    29.0,
                                  ),
                                ),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                                gradient: widget.course.background,
                                borderRadius: BorderRadius.circular(29.0)),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "28.K",
                                  style: kTitle2Style,
                                ),
                                Text(
                                  "Students",
                                  style: kSearchPlaceholderStyle,
                                )
                              ])
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.format_quote,
                                    color: Colors.white,
                                  ),
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    29.0,
                                  ),
                                ),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                                gradient: widget.course.background,
                                borderRadius: BorderRadius.circular(29.0)),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "12.4K",
                                  style: kTitle2Style,
                                ),
                                Text(
                                  "Comments",
                                  style: kSearchPlaceholderStyle,
                                )
                              ])
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
                  child: Row(children: [
                    indicators(),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        panelcontroller.open();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          width: 80.0,
                          height: 40.0,
                          child: Text(
                            "View all",
                            style: kSearchTextStyle,
                          )),
                    )
                  ]),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code",
                          style: kBodyLabelStyle,
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Text("About this course", style: kTitle1Style),
                        SizedBox(
                          height: 24.0,
                        ),
                        Text(
                          "This course was written for people who are passionate about design and about Apple's SwiftUI. It beginner-friendly, but it is also packed with tricks and cool workflows about building the best UI. Currently, Xcode 11 is still in beta so the installation process may be a little hard. However, once you get everything working, then it'll get much friendlier!",
                          style: kBodyLabelStyle,
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
