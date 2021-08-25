import 'package:flutter/material.dart';

class CardMovieWidget extends StatelessWidget {
  const CardMovieWidget({
    Key? key,
    required this.images,
  }) : super(key: key);
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: Image.asset(images).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
