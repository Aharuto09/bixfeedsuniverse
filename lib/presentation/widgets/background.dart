import 'dart:ui';
import 'package:bixfeeds_network_universe/data/palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
      child: Stack(
        children: [
          Center(
            // right: 0,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  color: Palettes().blueRose.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(200)),
            ),
          ).animate(onPlay: (controller) => controller.repeat()).shake(
                duration: const Duration(seconds: 6),
                hz: 0.15,
                offset: const Offset(350, -350),
              ),
          Center(
            // right: 0,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Palettes().pink.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(100)),
            ),
          )
              .animate()
              .fadeIn()
              .then()
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shake(
                  duration: const Duration(seconds: 10),
                  hz: 0.1,
                  offset: const Offset(350, 350)),
        ],
      ),
    ));
  }
}
