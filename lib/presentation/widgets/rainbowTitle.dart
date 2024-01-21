import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RainbowTitle extends StatelessWidget {
  const RainbowTitle(this.data,
      {super.key,
      required this.color,
      this.fontSize = 32,
      this.fontWeight = FontWeight.w600});
  final String data;
  final List<Color> color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: fontSize, fontWeight: fontWeight),
    )
        .animate(adapter: ValueAdapter(0.5))
        .shimmer(
          colors: color.reversed.toList(),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .then()
        .shimmer(
          colors: color,
          duration: const Duration(seconds: 5),
        );
  }
}
