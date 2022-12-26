import 'dart:math';
import 'package:flutter/material.dart';

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
        angleDegree = Random().nextInt(10) - 8;
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
