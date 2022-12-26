import 'package:flutter/material.dart';
import '../constant.dart';

//Side Button
class SidebarButton extends StatelessWidget {
  SidebarButton({required this.triggerAnimation});
  final Function triggerAnimation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (() {
        triggerAnimation();
      }),
      // highlightColor: Colors.transparent,
      // splashColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            )
          ],
          color: Color.fromARGB(255, 254, 254, 254),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset('asset/icons/icon-sidebar.png'),
      ),
    );
  }
}
