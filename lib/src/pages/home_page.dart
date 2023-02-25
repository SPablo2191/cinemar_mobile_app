import 'package:flutter/material.dart';
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
    return CardSwiper(items: [1, 2, 3, 4, 5]);
  }
}
