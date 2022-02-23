import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Core/app_string.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/home_page.dart';
import 'package:flutter_pluzzle/Services/hive_db.dart';
import 'package:flutter_pluzzle/Theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<ImageStore>(ImageStoreAdapter());
  await Hive.openBox<ImageStore>(AppString.dbName);
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
