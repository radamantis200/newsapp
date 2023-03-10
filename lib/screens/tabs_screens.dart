import 'package:flutter/material.dart';
import 'package:newsapp/models/navigation_model.dart';
import 'package:newsapp/screens/tab1_screens.dart';
import 'package:newsapp/screens/tab2_screens.dart';
import 'package:provider/provider.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: PageView(
        controller: navigationModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Tab1(),
          Tab2(),
        ],
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);
    return BottomNavigationBar(
        currentIndex: navigationModel.currentPage,
        onTap: (i) => navigationModel.currentPage = i,
        items: const [
          BottomNavigationBarItem(
              label: 'For You', icon: Icon(Icons.person_outline)),
          BottomNavigationBarItem(label: 'News', icon: Icon(Icons.public))
        ]);
  }
}
