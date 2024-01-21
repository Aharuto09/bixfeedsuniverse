// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ImageRounded extends StatelessWidget {
  ImageRounded(
      {super.key,
      required this.height,
      required this.width,
      required this.rounded,
      this.child,
      this.margin = 0,
      this.padding = 0});
  double width, height, rounded;
  final Widget? child;
  final double margin, padding;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rounded),
          border: Border.all(color: Colors.white30, width: 1),
          color: Colors.white10,
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/dummy.jpg"))),
      child: child,
    );
  }
}
