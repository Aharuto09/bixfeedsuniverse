import 'package:bixfeeds_network_universe/data/palettes.dart';
import 'package:bixfeeds_network_universe/presentation/widgets/background.dart';
import 'package:bixfeeds_network_universe/presentation/widgets/imageRounded.dart';
import 'package:bixfeeds_network_universe/presentation/widgets/rainbowTitle.dart';
import 'package:flutter/material.dart';

import '../widgets/home/collection.dart';
import '../widgets/home/lineBusiness.dart';
import '../widgets/home/teamMain.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0, scrollMax = 0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollMax = _scrollController.position.maxScrollExtent;
        scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool minimize = (width > 800);

    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const SafeArea(child: Background()),
          SizedBox(
            height: height,
            width: width,
            child: RawScrollbar(
              controller: _scrollController,
              crossAxisMargin: 10,
              mainAxisMargin: 100,
              thumbColor: Colors.white,
              radius: const Radius.circular(16),
              thickness: 7,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: height,
                    ),
                    // const SizedBox(height: 160),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 20,
                        spacing: 20,
                        children: [
                          ImageRounded(
                            height: 140,
                            width: minimize ? 320 : width - 40,
                            rounded: 29,
                          ),
                          // const SizedBox(width: 40),
                          const SizedBox(
                            height: 160,
                            width: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "1+ Lorem Ipsum",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 20),
                                Flexible(
                                  // width: width > 800 ? double.infinity : 200,
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ImageRounded(
                            height: 140,
                            width: minimize ? 120 : width - 240,
                            rounded: 29,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                    RainbowTitle("Line of Business", color: [
                      Colors.white,
                      Palettes().pink,
                      Palettes().orange
                    ]),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: const Text(
                        "Your story is crafted not only for entertainment but also to redefine the landscape of various Lines of Business.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    LineBusiness(
                      showMain: (scrollPosition > 600) ? true : false,
                      showBack: (scrollPosition > 800) ? true : false,
                    ),
                    // const SizedBox(height: 100),
                    const RainbowTitle("The Best Collection",
                        color: [Colors.blue, Colors.white, Colors.amber]),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: const Text(
                        "Meet the Minds Behind the Magic: Your Go-To Team for Innovative Media Entertainment.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Collection(),
                    // const SizedBox(height: 80),
                    TeamMain(height: height, width: width, rotate: 0),
                    const RainbowTitle(
                      "The Client",
                      color: [Colors.amber, Colors.white, Colors.blue],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: const Text(
                        "Meet the Minds Behind the Magic: Your Go-To Team for Innovative Media Entertainment.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height < 200)
                ? 30
                : (scrollPosition > ((height - 350) / 2))
                    ? 0 -
                        height *
                            (scrollPosition - ((height - 350) / 2)) /
                            (height - ((height - 350) / 2))
                    : 0,
            child: SizedBox(
                // color: Colors.amber,
                height: height,
                width: width,
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: minimize
                            ? (height / 2) + 20
                            : (height / 2) + 20 - (60 - (60 * width / 800)),
                        child: Transform.scale(
                          scale: (width > 800) ? 1 : width / 800,
                          child: RainbowTitle("Modern  Creative",
                              fontSize: 64,
                              color: [
                                Palettes().blue,
                                Palettes().blueRose,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Palettes().pink,
                                Palettes().orange
                              ]),
                        ),
                      ),
                      Center(
                        child: Transform.scale(
                          // duration: Duration(milliseconds: 300),
                          scale: minimize ? 1 : width / 800,
                          child: OverflowBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 70,
                                    width: 220,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        color: Colors.white12,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/leftTag.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                RainbowTitle("Media", fontSize: 64, color: [
                                  Palettes().pinkRose,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Palettes().blueRose
                                ]),
                                const SizedBox(width: 30),
                                Flexible(
                                  child: Container(
                                    height: 70,
                                    width: 220,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        color: Colors.white12,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/rightTag.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: minimize
                            ? (height / 2) + 20
                            : (height / 2) + 20 - (60 - (60 * width / 800)),
                        child: Transform.scale(
                          scale: minimize ? 1 : width / 800,
                          child: RainbowTitle("Entertainment",
                              fontSize: 64,
                              color: [
                                Palettes().bluePurple,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Palettes().yellow
                              ]),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Positioned(
                        bottom: minimize
                            ? (height / 2) - 170
                            : (height / 2) - 170 + (60 - (60 * width / 800)),
                        // (height / 2) - 170,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                // foregroundColor: Colors.white10,

                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Colors.white30),
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text("let's Business")),
                      ),
                    ])
                // : Center(
                //     child: RainbowTitle(
                //       "Modern\nCreative Media\nEntertainment",
                //       fontWeight: FontWeight.bold,
                //       fontSize: 36,
                //       color: [
                //         Palettes().blue,
                //         Colors.white,
                //         Colors.white,
                //         Palettes().pink,
                //         Palettes().orange
                //       ],
                //     ),
                //   ),
                ),
          ),
        ],
      ),
    );
  }
}
