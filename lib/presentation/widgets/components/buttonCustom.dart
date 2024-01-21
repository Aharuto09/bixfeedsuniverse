import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(this.data, {super.key, required this.onPress});
  final String data;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            // foregroundColor: Colors.white10,

            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.white30),
                borderRadius: BorderRadius.circular(20))),
        child: Text(data));
  }
}
