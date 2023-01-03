import 'package:flutter/material.dart';
import 'package:newsapp/screens/tabs_screens.dart';
import 'package:newsapp/theme/theme.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: myTheme,
        initialRoute: 'home',
        routes: {'home': (_) => const Tabs()});
  }
}
