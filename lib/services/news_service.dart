import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _urlApi = 'newsapi.org';
const _apiKey = 'c4da00925cbe4135a5df615ef11eec96';

class NewsService with ChangeNotifier {
  String _selectedCategory = 'business';
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> articleByCategory = {};
  bool _isLoading = true;

  NewsService() {
    loadHeadlines();
    for (var element in categories) {
      articleByCategory[element.name] = [];
    }
    newsByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;
  List<Article> get newsByCategoryList => articleByCategory[selectedCategory]!;

  set selectedCategory(String value) {
    _selectedCategory = value;
    _isLoading = true;
    newsByCategory(value);
    notifyListeners();
  }

  bool get isLoading => _isLoading;

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

  newsByCategory(String category) async {
    if (articleByCategory[category]!.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return articleByCategory[category];
    }
    final url = Uri.https(_urlApi, 'v2/top-headlines',
        {'country': 'us', 'apiKey': _apiKey, 'category': category});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final newsResponse = newsResponseFromJson(response.body);
      articleByCategory[category]!.addAll(newsResponse.articles);
      _isLoading = false;
      notifyListeners();
    }
  }
}
