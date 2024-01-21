import 'package:bixfeeds_network_universe/presentation/widgets/imageRounded.dart';
import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  double current = 2;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ImageRounded(
          height: 480,
          padding: 40,
          width: 720,
          rounded: 10,
          margin: 20,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Videos title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Deskription title",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 10),
        SizedBox(
          height: 110,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                    onExit: (event) {
                      setState(() {
                        current = 2;
                      });
                    },
                    child: ImageRounded(
                      width: width > 600
                          ? (i == current)
                              ? 110
                              : 90
                          : (width - 100) / 5,
                      height: (i == current) ? 80 : 60,
                      rounded: 10,
                      margin: 3,
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
