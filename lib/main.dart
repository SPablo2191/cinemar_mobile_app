import 'package:flutter/material.dart';

import 'src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinemar',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),
    );
  }
}
