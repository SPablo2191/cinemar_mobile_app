import 'package:cinemar_mobile_app/src/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> items;
  const CardSwiper({required this.items, super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      width: screenSize.width,
      height: screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: screenSize.width * 0.7,
        itemHeight: screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(items[index].getPosterImage())),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
