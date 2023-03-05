import 'package:flutter/material.dart';
import 'package:cinemar_mobile_app/src/providers/movie_provider.dart';
import 'package:cinemar_mobile_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cinemar'),
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [_cardSwiper()],
        ));
  }

  _cardSwiper() {
    // in order to return async data => future builder
    final MovieProvider movieProvider = MovieProvider();
    print(movieProvider.getNowPlaying());
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
