import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const HeaderText(
      {Key? key,
      required this.text,
      this.size = 25.0,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
