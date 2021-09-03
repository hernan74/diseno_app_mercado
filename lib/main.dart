import 'package:diseno_app_mercado/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {'home': (_) => HomePage()},
    );
  }
}
