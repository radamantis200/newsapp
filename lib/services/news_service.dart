import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:http/http.dart' as http;

const _urlApi = 'newsapi.org';
const _apiKey = 'c4da00925cbe4135a5df615ef11eec96';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    loadHeadlines();
  }

  loadHeadlines() async {
    final url = Uri.https(
        _urlApi, 'v2/top-headlines', {'country': 'us', 'apiKey': _apiKey});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final newsResponse = newsResponseFromJson(response.body);
      headlines.addAll(newsResponse.articles);
      notifyListeners();
    }
  }
}
