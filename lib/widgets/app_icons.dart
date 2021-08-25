import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        AutoSizeText(
          title,
          minFontSize: 8,
          maxLines: 4,
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
