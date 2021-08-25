import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          wordSpacing: 2,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
