import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinemar_mobile_app/src/providers/movie_provider.dart';
import 'package:cinemar_mobile_app/src/widgets/card_swiper_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          flexibleSpace: ClipRRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          )),
          elevation: 0,
          title: Text(
            'Cinemar',
            style: GoogleFonts.dmSans(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.white.withAlpha(200),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            _cardSwiper()
          ],
        ));
  }

  _cardSwiper() {
    // in order to return async data => future builder
    final MovieProvider movieProvider = MovieProvider();
    return FutureBuilder(
      future: movieProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(items: snapshot.data);
        } else {
          return const SizedBox(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
