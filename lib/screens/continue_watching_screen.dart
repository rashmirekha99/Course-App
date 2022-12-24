import 'dart:math';

import 'package:demo/model/ExploreItems.dart';
import 'package:demo/model/continueWatching.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../model/continueWatching.dart';
import '../component/list/continue_watching_list.dart';
import '../constant.dart';
import '../model/CardItems.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      color: kCardPopupBackgroundColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34),
        topRight: Radius.circular(34),
      ),
      boxShadow: [
        BoxShadow(color: kShadowColor, offset: Offset(0, -12), blurRadius: 32.0)
      ],
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
              child: Container(
                width: 42.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text("Continue Watching", style: kTitle2Style),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: ContinueWatchList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text("Certificates", style: kTitle2Style),
          ),
          CetificateViewer(),
        ],
      ),
    );
  }
}

class CetificateViewer extends StatefulWidget {
  const CetificateViewer({Key? key}) : super(key: key);

  @override
  State<CetificateViewer> createState() => _CetificateViewerState();
}

class _CetificateViewerState extends State<CetificateViewer> {
  final List<String> certificatePaths = [
    'asset/certificates/certificate-01.png',
    'asset/certificates/certificate-02.png',
    'asset/certificates/certificate-03.png',
  ];
  late Widget certificateViewer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<Widget> imageChildren = [];
    certificatePaths.reversed.toList().asMap().forEach((index, certificate) {
      int angleDegree;
      if (index == certificatePaths.length - 1) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(10) - 5;
      }
      imageChildren.add(Transform.rotate(
        angle: angleDegree * (pi / 180),
        child: Image.asset(
          certificate,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ));
    });
    certificateViewer = Stack(children: imageChildren);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 20), child: certificateViewer);
  }
}
