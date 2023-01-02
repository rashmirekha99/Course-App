import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../model/ExploreItems.dart';

class ExploreCourseCard extends StatefulWidget {
  ExploreCourseCard({required this.course});
  final Course course;

  @override
  State<ExploreCourseCard> createState() => _ExploreCourseCardState();
}

class _ExploreCourseCardState extends State<ExploreCourseCard> {
  final _storage = FirebaseStorage.instance;
  String illustrationurl = '';
  void getIllustration() {
    _storage
        .ref('illustrations/${widget.course.illustration}')
        .getDownloadURL()
        .then((url) {
      setState(() {
        illustrationurl = url;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIllustration();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(
            gradient: widget.course.background,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 32.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.courseSubtitle,
                        style: kCardSubtitleStyle,
                      ),
                      SizedBox(height: 6),
                      Text(
                        widget.course.courseTitle,
                        style: kCardTitleStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    illustrationurl == ''
                        ? Container()
                        : Image.network(
                            '${illustrationurl}',
                            fit: BoxFit.cover,
                            height: 100.0,
                          )
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
