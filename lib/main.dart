import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'src/shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final botToastBuilder = BotToastInit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gallery',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
    );
  }
}
