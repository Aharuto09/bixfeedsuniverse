import 'package:bixfeeds_network_universe/presentation/widgets/imageRounded.dart';
import 'package:flutter/material.dart';

class TeamMain extends StatefulWidget {
  const TeamMain(
      {super.key,
      required this.height,
      required this.width,
      required this.rotate});
  final double height, width, rotate;

  @override
  State<TeamMain> createState() => _TeamMainState();
}

class _TeamMainState extends State<TeamMain> {
  double current = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 800,
        width: 800,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10
                // widget.height >= widget.width
                //     ? widget.height * 0.09
                //     : widget.width * 0.09,
                ),
            const Text(
              "Behind the Magic",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Text(
                  "Meet the Team Behind the Magic: Your Go-To Team for Innovative Media Entertainment.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (double i = 0; i < 5; i++)
                    MouseRegion(
                      onHover: (event) {
                        setState(() {
                          current = i;
                        });
                      },
                      child: ImageRounded(
                        height: double.infinity,
                        width: (widget.width > 800)
                            ? current == i
                                ? 360
                                : 80
                            : current == i
                                ? widget.width * 0.4
                                : 30,
                        rounded: 20,
                        margin: 5,
                        padding: (widget.width > 800) ? 40 : 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Nama Lengkap",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  overflow: TextOverflow.fade),
                            ),
                            SizedBox(height: (widget.width > 800) ? 10 : 0),
                            const Text(
                              "Jabatan di perusahaam",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.fade),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )),
            const SizedBox(
              height: 200,
            )
          ],
        ));
  }
}
