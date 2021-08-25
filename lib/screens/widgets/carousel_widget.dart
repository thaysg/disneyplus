import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget({Key? key}) : super(key: key);

  final _imageUrls = [
    'assets/images/falcon.jpg',
    'assets/images/loki.jpg',
    'assets/images/mandalorian.jpeg',
    'assets/images/wanda.jpeg',
    'assets/images/whatif.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      height: 250,
      width: MediaQuery.of(context).size.width * .9,
      child: Swiper(
        autoplay: true,
        viewportFraction: .9,
        scale: 0.9,
        pagination: SwiperPagination(
          margin: EdgeInsets.fromLTRB(900.0, 0.0, 0.0, 30.0),
          builder: DotSwiperPaginationBuilder(
            color: Colors.white30,
            activeColor: Colors.white,
            size: 6.0,
            activeSize: 8.0,
          ),
        ),
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF0B0D15),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(5, 1), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                image: ExactAssetImage(
                  _imageUrls[index],
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
