import 'package:demo/component/sidebarRow.dart';
import 'package:demo/constant.dart';
import 'package:demo/model/SidebarItem.dart';
import 'package:flutter/material.dart';
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 40.0,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: const BoxDecoration(
        color: ksidebarColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 23.0,
                ),
                const SizedBox(width: 10.0),
                Column(
                  children: const [
                    Text(
                      "Rashmi Rekha",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text("Your licene expire on",
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 118, 116, 116))),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            SidebarRow(items: sidebaritems[0]),
            const SizedBox(height: 32.0),
            SidebarRow(items: sidebaritems[1]),
            const SizedBox(height: 32.0),
            SidebarRow(items: sidebaritems[3]),
            const SizedBox(height: 32.0),
            SidebarRow(items: sidebaritems[2]),
            const Spacer(),
            Row(
              children: const[
                Icon(Icons.logout_outlined),
                SizedBox(width: 10.0),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
