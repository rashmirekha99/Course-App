import 'package:flutter/material.dart';
import '../../model/continueWatching.dart';
import '../card/continue_watching_card.dart';

class ContinueWatchList extends StatefulWidget {
  const ContinueWatchList({Key? key}) : super(key: key);

  @override
  State<ContinueWatchList> createState() => _ContinueWatchListState();
}

class _ContinueWatchListState extends State<ContinueWatchList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingCourses.map(
        (e) {
          var index = continueWatchingCourses.indexOf(e);
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              width: 7.0,
              height: 7.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.blue : Colors.grey,
              ));
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                opacity: index == currentPage ? 1.0 : 0.7,
                child: ContinueWatchinCard(
                  cardItems: continueWatchingCourses[index],
                ),
              );
            },
            itemCount: continueWatchingCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.70),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateIndicator()
      ],
    );
  }
}
