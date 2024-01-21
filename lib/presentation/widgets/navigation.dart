import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Navigation extends StatelessWidget {
  Navigation({super.key, required this.current, required this.controller});
  double current;
  PageController controller;
  void toPage(int index) {
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    Color navColor(double index) {
      if (current == index) {
        return Colors.white;
      } else {
        return Colors.white24;
      }
    }

    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xff09111E),
        const Color(0xff09111E).withOpacity(0.7),
        const Color(0xff09111E).withOpacity(0.3),
        const Color(0xff09111E).withOpacity(0),
        const Color(0xff09111E).withOpacity(0),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Text(width.toString()),
          (width > 720)
              ? Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          toPage(0);
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(color: navColor(0)),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          toPage(1);
                        },
                        child: Text(
                          "Teams",
                          style: TextStyle(color: navColor(1)),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          toPage(2);
                        },
                        child: Text(
                          "About",
                          style: TextStyle(color: navColor(2)),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          toPage(3);
                        },
                        child: Text(
                          "Contact",
                          style: TextStyle(color: navColor(3)),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Positioned(
            top: 20,
            child: SizedBox(
              height: 50,
              width: 130,
              child: SvgPicture.asset(
                "assets/svg/logo.svg",
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
