import 'package:demo/constant.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSidebarBackgroundColor,
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -75, 0),
                      child: Image.asset(
                          'asset/illustrations/illustration-14.png'),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -170, 0),
                      child: Column(
                        children: [
                          Text(
                            "Learn to design\nand code apps",
                            style:
                                kLargeTitleStyle.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Complete courses about the best\ntools and design systems",
                            style: kHeadlineLabelStyle.copyWith(
                                color: Colors.white70),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0, -150, 0),
                  // color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 53.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Log in to",
                          style: kTitle1Style,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Start Learning",
                          style:
                              kTitle1Style.copyWith(color: Color(0xFF5B4CF0)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 130.0,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: kShadowColor,
                                          offset: Offset(0, 12),
                                          blurRadius: 16.0)
                                    ]),
                                child: Column(
                                  children: [
                                    //email
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        right: 16.0,
                                        left: 16.0,
                                      ),
                                      child: TextField(
                                        cursorColor: kPrimaryLabelColor,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Email Address',
                                          icon: Icon(
                                            Icons.email,
                                            color: Color(0xFF5488F1),
                                            size: 20.0,
                                          ),
                                        ),
                                        onChanged: (enteredText) {
                                          email = enteredText;
                                          print(email);
                                        },
                                      ),
                                    ),
                                    const Divider(),
                                    //password field
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        right: 16.0,
                                        left: 16.0,
                                      ),
                                      child: TextField(
                                        cursorColor: kPrimaryLabelColor,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Password',
                                          icon: Icon(
                                            Icons.lock,
                                            color: Color(0xFF5488F1),
                                            size: 20.0,
                                          ),
                                        ),
                                        onChanged: (enteredText) {
                                          password = enteredText;
                                          print(password);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                try {
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                } on FirebaseAuthException catch (err) {
                                  if (err.code == 'user-not-found') {
                                    try {
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password)
                                          .then(
                                            (user) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            ),
                                          );
                                    } catch (err) {}
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Error"),
                                            content: Text(err.code),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Ok'))
                                            ],
                                          );
                                        });
                                  }
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  style: kCalloutLabelStyle.copyWith(
                                      color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF73A0F4),
                                      Color(0xFF74A47F5),
                                    ],
                                  ),
                                ),
                                height: 47.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: Text("Forgot Password?",
                              style: kCalloutLabelStyle.copyWith(
                                  color: Color(0x721B1E9C))),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
