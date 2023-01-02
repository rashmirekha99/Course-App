import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/list/certificate_viewer.dart';
import '../component/list/completed_course_list.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var badges = [];

  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  var name = 'loading...';
  var bio = 'loading...';

  @override
  void initState() {
    super.initState();
    loadUserData();
    loadBadges();
  }

//update data
  void updateUserDetails() {
    _firestore.collection('users').doc(_auth.currentUser?.uid).update({
      'name': name,
      'bio': bio,
    }).then((value) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Sucess!'),
              content: const Text('Your details has been updated'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ],
            );
          });
    });
  }

//get data
  void loadUserData() {
    _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .get()
        .then((snapshot) {
      setState(() {
        name = snapshot.data()?['name'];
        bio = snapshot.data()?['bio'];
      });
    });
  }

  //get badge data and add it to the list
  void loadBadges() {
    _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .get()
        .then((snapshot) {
      for (var badge in snapshot.data()?["badges"]) {
        _storage.ref("badges/$badge").getDownloadURL().then((url) {
          setState(() {
            badges.add(url);
            print(url);
          });
        });
      }
    });
  }

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
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Edit Details'),
                                        content: Container(
                                          child: Column(
                                            children: [
                                              TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    name = value;
                                                  });
                                                },
                                                controller:
                                                    TextEditingController(
                                                        text: name),
                                              ),
                                              TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    bio = value;
                                                  });
                                                },
                                                controller:
                                                    TextEditingController(
                                                        text: bio),
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                updateUserDetails();
                                              },
                                              child: Text('Done'))
                                        ],
                                      );
                                    });
                              },
                              child: Container(
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
                                      ? Icons.edit
                                      : CupertinoIcons.pencil,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //middle part - Profile name,bio
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
                                  "${name}",
                                  style: kTitle2Style,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  "${bio}",
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
                              child: Image.network('${badges[index]}'),
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
