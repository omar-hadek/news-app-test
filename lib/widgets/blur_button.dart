import 'package:flutter/material.dart';

class BlurButton extends StatelessWidget {
  final String text;
  const BlurButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint('ElevatedButton Clicked');
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
