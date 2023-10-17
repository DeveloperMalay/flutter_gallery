import 'package:flutter/material.dart';
import 'package:gallery/pages/horizontal_paralax_view_screen.dart';

import 'pages/choose_view_screen.dart';
import 'pages/paralax_view_screen.dart';

void main() {
  runApp(const MyApp());
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: const ChooseViewScreen(),
      // home: const MyHomePage(title: 'Paralax Effect'),
    );
  }
}

