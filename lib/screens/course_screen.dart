import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../model/CardItems.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({required this.course});
  final CardItems course;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SingleChildScrollView(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              style: kSecondaryCalloutLabelStyle
                                                  .copyWith(
                                                      color: Colors.white70)),
                                        ),
                                        Hero(
                                          tag: widget.course.title,
                                          child: Text(widget.course.title,
                                              style: kLargeTitleStyle.copyWith(
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
