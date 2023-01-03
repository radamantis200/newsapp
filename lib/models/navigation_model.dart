import 'package:flutter/material.dart';

class NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.bounceOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
