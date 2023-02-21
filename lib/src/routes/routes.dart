import 'package:flutter/material.dart';
import '../pages/home_page.dart';
getRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
  };
}