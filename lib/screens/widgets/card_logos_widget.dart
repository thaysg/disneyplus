import 'package:flutter/material.dart';

class CardLogosWidget extends StatelessWidget {
  CardLogosWidget({Key? key, required this.image}) : super(key: key);

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 95,
      width: size.width * .16,
      decoration: BoxDecoration(
        color: Color(0xFF0B0D15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF151723),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Image(
        image: image,
        fit: BoxFit.contain,
      ),
    );
  }
}

class CardRowLogo extends StatelessWidget {
  const CardRowLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardLogosWidget(
          image: AssetImage(
            'assets/images/logo1.png',
          ),
        ),
        CardLogosWidget(
          image: AssetImage(
            'assets/images/pixar.png',
          ),
        ),
        CardLogosWidget(
          image: AssetImage(
            'assets/images/marvel.png',
          ),
        ),
        CardLogosWidget(
          image: AssetImage(
            'assets/images/starwars.png',
          ),
        ),
        CardLogosWidget(
          image: AssetImage(
            'assets/images/natgeo.png',
          ),
        ),
      ],
    );
  }
}
