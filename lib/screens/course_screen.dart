import 'package:demo/component/courseCard.dart';
import 'package:demo/model/courseSection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../constant.dart';
import '../model/CardItems.dart';

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

class CourseSectionScreen extends StatelessWidget {
  const CourseSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            decoration: const BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Course Section",
                  style: kTitle2Style,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "12 Sections",
                  style: ksubTitleStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          // CourseSectionCard(courseSection: courseSections[0]),
          CourseSectionList(),
        ],
      ),
    );
  }
}

class CourseSectionList extends StatelessWidget {
  List<Widget> courseSectionWidgets() {
    List<Widget> cards = [];
    for (var course in courseSections) {
      cards.add(
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: CourseSectionCard(courseSection: course),
        ),
      );
    }

    cards.add(
      Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text(
          "No more sections to view, look\nfor more in our courses",
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: courseSectionWidgets(),
      ),
    );
  }
}

class CourseSectionCard extends StatelessWidget {
  CourseSectionCard({required this.courseSection});
  final CourseSection courseSection;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41),
          gradient: courseSection.background,
          boxShadow: [
            BoxShadow(
                color: courseSection.background.colors[0].withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 30.0),
            BoxShadow(
                color: courseSection.background.colors[1].withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 30.0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41.0),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${courseSection.illustration}',
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            courseSection.courseSubtitle,
                            style: kCardSubtitleStyle,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            courseSection.courseTitle,
                            style: kCardTitleStyle,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
