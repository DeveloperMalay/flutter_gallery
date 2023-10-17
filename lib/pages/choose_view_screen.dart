import 'package:flutter/material.dart';
import 'package:gallery/main.dart';

import 'vertical_paralax_view_screen.dart';

class ChooseViewScreen extends StatelessWidget {
  const ChooseViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Choose View',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.radio_button_checked_outlined,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Paralax Effect',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
