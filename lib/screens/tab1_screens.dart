import 'package:flutter/material.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsService = Provider.of<NewsService>(context);
    return (newsService.headlines.isEmpty)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : NewsList(news: newsService.headlines);
  }

  @override
  bool get wantKeepAlive => true;
}
