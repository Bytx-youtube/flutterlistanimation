import 'package:flutter/material.dart';
import 'package:flutteranimatedlist/homescreen.dart';
import 'package:flutteranimatedlist/listscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  int screenState = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    late Widget body;

    switch(screenState) {
      case 0:
        body = const HomeScreen();
        break;
      case 1:
        body = const ListScreen();
        break;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF222431),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: body,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  rowItem("HOME", 0),
                  Container(
                    width: 1,
                    color: Colors.black26,
                  ),
                  rowItem("LIST", 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowItem(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            screenState = index;
          });
        },
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

}
