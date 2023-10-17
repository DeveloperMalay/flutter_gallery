import 'package:flutter/material.dart';

import '../main.dart';
import 'horizontal_paralax_view_screen.dart';
import 'paralax_view_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: darkBlue),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Paralax Effect',
          style: TextStyle(color: darkBlue),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedContainerPopup()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: const ParallaxRecipe(),
    );
  }
}
