import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const HintText(
      {Key? key,
      required this.text,
      this.size = 14.0,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
