import 'package:bixfeeds_network_universe/presentation/widgets/components/buttonCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../imageRounded.dart';

class LineBusiness extends StatefulWidget {
  const LineBusiness(
      {super.key, required this.showMain, required this.showBack});
  final bool showMain, showBack;
  @override
  State<LineBusiness> createState() => _LineBusinessState();
}

class _LineBusinessState extends State<LineBusiness> {
  List<Map<String, dynamic>> items = [
    {
      "title": "Senada Film",
      "subtitle": "Lorem ipsum dolor sit amet",
      "url": "link web masing",
    },
    {
      "title": "Clouvestudio",
      "subtitle": "Lorem ipsum dolor sit amet",
      "url": "link web masing",
    },
  ];
  int indexHover = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool maximize = true;
    if (width > 500) {
      maximize = true;
    } else {
      maximize = false;
    }

    return Container(
      // margin: const EdgeInsets.all(30),
      height: 450,
      width: width,
      child: Stack(alignment: Alignment.center, children: [
        ...items.asMap().entries.map((entry) => Positioned(
            right: entry.key == 0 ? (width / 2) : null,
            left: entry.key == 1 ? (width / 2) : null,
            child: Transform.scale(
              scale: 0.8,
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    indexHover = entry.key;
                  });
                },
                onExit: (event) {
                  setState(() {
                    indexHover = 3;
                  });
                },
                child: ImageRounded(
                  height: 350,
                  width: maximize ? 220 : 140,
                  rounded: 20,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black45,
                                  Colors.black38,
                                  Colors.black.withOpacity(0)
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Spacer(),
                            Text(
                              entry.value["title"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              entry.value["subtitle"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            ButtonCustom("Visit", onPress: () {})
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    .animate(target: widget.showBack ? 1 : 0)
                    .slideX(
                      begin: entry.key == 0 ? 1 : -1,
                      end: entry.key == 0 ? 0 : 0,
                    )
                    .fade(
                        curve: Curves.fastOutSlowIn,
                        begin: 0,
                        end: 1,
                        delay: const Duration(milliseconds: 100))
                    .animate(target: indexHover == entry.key ? 1 : 0)
                    .rotate(begin: 0, end: entry.key == 0 ? -0.02 : 0.02)
                    .slideX(
                        begin: 0,
                        end: maximize
                            ? entry.key == 0
                                ? -0.35
                                : 0.35
                            : entry.key == 0
                                ? -0.5
                                : 0.5)
                    .scale(
                        begin: const Offset(1, 1), end: const Offset(1.1, 1.1)),
              ),
            ))),
        Center(
          child: MouseRegion(
            onEnter: (event) {
              setState(() {
                indexHover = 2;
              });
            },
            onExit: (event) {
              setState(() {
                indexHover = 3;
              });
            },
            child: ImageRounded(
                height: 350,
                width: maximize ? 220 : 160,
                rounded: 20,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black45,
                                Colors.black12,
                                Colors.black.withOpacity(0)
                              ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          const Text(
                            "Bixfeed Media",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Lorem ipsum dolor sit amet",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: ButtonCustom(
                              "Visit",
                              onPress: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        )
            .animate(target: widget.showMain ? 1 : 0)
            .slideY(curve: Curves.fastOutSlowIn, begin: 1, end: 0)
            .fade(
                curve: Curves.fastOutSlowIn,
                begin: 0,
                end: 1,
                delay: const Duration(milliseconds: 100))
            .animate(target: indexHover == 2 ? 1 : 0)
            .scale(
                curve: Curves.fastOutSlowIn,
                begin: const Offset(1, 1),
                end: const Offset(1.1, 1.1))
      ]),
    );
  }
}
