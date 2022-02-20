import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/home_page.dart';
import 'package:flutter_pluzzle/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Puzzle Hack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: Themes.textTheme,
      ),
      home: const HomePage(),
    );
  }
}

void pageNavigation(context, Widget newPage) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => newPage));
