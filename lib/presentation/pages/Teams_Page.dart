import 'package:bixfeeds_network_universe/data/palettes.dart';
import 'package:bixfeeds_network_universe/presentation/widgets/imageRounded.dart';
import 'package:bixfeeds_network_universe/presentation/widgets/rainbowTitle.dart';
import 'package:flutter/material.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  PageController _controller = PageController();
  int current = 3;
  void setCurrent(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          const SizedBox(height: 100),
          RainbowTitle("The Teams", color: [
            Palettes().blueRose,
            Colors.white,
            Colors.white,
            Colors.white,
            Palettes().pinkRose
          ]),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Text(
              "Meet the Minds Behind the Magic: Your Go-To Team for Innovative Media Entertainment",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                  for (var i = 0; i < 11; i++)
                    GestureDetector(
                      onTap: () => setCurrent(i),
                      child: ImageRounded(
                        height: current == i ? height - 350 : height - 420,
                        width: current == i ? 240 : 60,
                        rounded: 20,
                        margin: 5,
                        child: Column(
                          children: [
                            Text("Nama Lengkap"),
                            Text("Jabatan"),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
