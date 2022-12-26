import 'dart:io';
import 'package:demo/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/list/certificate_viewer.dart';
import '../component/list/completed_course_list.dart';

class ProfileScreen extends StatelessWidget {
  List<String> badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //full to p container
              Container(
                decoration: const BoxDecoration(
                    color: kCardPopupBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(34.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: kShadowColor,
                          offset: Offset(0, 12),
                          blurRadius: 32.0)
                    ]),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      //top bar row
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          bottom: 32.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //back Button
                            RawMaterialButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              constraints: const BoxConstraints(
                                minWidth: 40.0,
                                maxWidth: 40.0,
                                maxHeight: 24.0,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: kSecondaryLabelColor,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Profile",
                              style: kCalloutLabelStyle,
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: kShadowColor,
                                      offset: Offset(0, 12),
                                      blurRadius: 32.0)
                                ],
                              ),
                              child: Icon(
                                Platform.isAndroid
                                    ? Icons.settings
                                    : CupertinoIcons.settings_solid,
                              ),
                            )
                          ],
                        ),
                      ),
                      //middle part - Meng To
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            //blue round
                            Container(
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                //profile white round
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  //profile pic
                                  child: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('asset/images/profile.jpg'),
                                    radius: 30.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(42.0)),
                                ),
                              ),
                              height: 84.0,
                              width: 84.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(42.0),
                                gradient: const RadialGradient(
                                  colors: [
                                    Color(0xFF00AEFF),
                                    Color(0xFF0076FF),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 26.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Meng To",
                                  style: kTitle2Style,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  "Flutter Developer",
                                  style: kSecondaryCalloutLabelStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //badges text
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Badges",
                                    style: kHeadlineLabelStyle,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "See all",
                                        style: kSearchPlaceholderStyle,
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: kSecondaryLabelColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        height: 112,
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 28.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: badges.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: index == 3 ? 20.0 : 0.0),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: kShadowColor.withOpacity(0.1),
                                  offset: Offset(0, 12),
                                  blurRadius: 18.0,
                                )
                              ]),
                              child:
                                  Image.asset('asset/badges/${badges[index]}'),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 12.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Certificates",
                          style: kHeadlineLabelStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              "See all",
                              style: kSearchPlaceholderStyle,
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        )
                      ],
                    ),
                    CetificateViewer(),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 12.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Completed Courses",
                          style: kHeadlineLabelStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              "See all",
                              style: kSearchPlaceholderStyle,
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        )
                      ],
                    ),
                    CompletedCourseList(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
