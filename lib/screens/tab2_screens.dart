import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:newsapp/widgets/news_list.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/services/news_service.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    final news = newService.newsByCategoryList;
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        const _ListCategories(),
        !newService.isLoading
            ? Expanded(child: NewsList(news: news))
            : const Expanded(
                child: Center(
                child: CircularProgressIndicator(),
              ))
      ]),
    ));
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryButtom(categories: categories[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(categories[index].name),
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButtom extends StatelessWidget {
  const _CategoryButtom({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final Category categories;

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context, listen: false);
    return GestureDetector(
      onTap: () {
        newService.selectedCategory = categories.name;
      },
      child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            categories.icon,
            color: (newService.selectedCategory == categories.name)
                ? myTheme.colorScheme.secondary
                : Colors.black54,
          )),
    );
  }
}
