import 'package:ace_broadcast/pages/navigation_bar/navigation_bar.dart';
import 'package:ace_broadcast/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACE Broadcast',
      theme: lightMode,
      darkTheme: darkMode,
      home: const NavigationPage(),
    );
  }
}
