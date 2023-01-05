import 'package:flutter/material.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return NewsList(news: newsService.headlines);
  }
}
