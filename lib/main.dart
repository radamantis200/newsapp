import 'package:flutter/material.dart';
import 'package:newsapp/screens/tabs_screens.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsService())],
      child: MaterialApp(
          theme: myTheme,
          initialRoute: 'home',
          routes: {'home': (_) => const Tabs()}),
    );
  }
}
