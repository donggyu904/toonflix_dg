import 'package:flutter/material.dart';
import 'package:toonflix_dg_again/pages/homescreen.dart';

void main() async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // await preferences.clear();
  runApp(const MyApp());
  // ServiceApi.test();
  // ServiceApi.getWebtoonDetailByID('790713');
  // ServiceApi.getTodayWebtoonsList();
  // ServiceApi.getWebtoonEpisodeListByID("790713");
  // print("dd");
}

//abcdef
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.orange,
            titleTextStyle: TextStyle(fontSize: 22, color: Colors.black)),
        backgroundColor: const Color(0xFFE7626c),
        textTheme: const TextTheme(
          /// main page Webtoon introduce text
          headline1: TextStyle(
            color: Color(0xFF232B55),
            fontSize: 30,
          ),
          bodyText1: TextStyle(
            fontSize: 20,
          ),
          bodyText2: TextStyle(
            fontSize: 15,
          ),
        ),
        cardColor: Colors.orange,
      ),
    );
  }
}
