import 'package:flutter/material.dart';

import '../constant.dart';

//Searchbar
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            )
          ]),
      child: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for courses',
          icon: Icon(Icons.search),
        ),
        onChanged: (newText) {
          print(newText);
        },
      ),
    );
  }
}
