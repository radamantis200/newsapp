import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;
  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: ((context, index) =>
            _News(news: news[index], index: index)));
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({required this.news, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          _CardTopBar(news: news, index: index),
          _CardTitle(news: news),
          _CardImage(news: news),
          _CardBody(news: news),
          _CardBottom(),
          const SizedBox(
            height: 10,
          ),
          const Divider()
        ],
      ),
    );
  }
}

class _CardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
            fillColor: myTheme.colorScheme.secondary,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border)),
        const SizedBox(
          width: 20,
        ),
        RawMaterialButton(
            fillColor: Colors.blue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more))
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _CardTopBar({required this.news, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text(
          '${index + 1}.',
          style: TextStyle(color: myTheme.colorScheme.secondary),
        ),
        Text(news.source.name),
        const SizedBox(
          width: 10,
        ),
        Text((news.author != null) ? '${news.author}' : 'no author')
      ]),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article news;
  const _CardTitle({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article news;
  const _CardImage({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (news.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/images/giphy.gif'),
                    image: NetworkImage('${news.urlToImage}'))
                : const Image(image: AssetImage('assets/images/no-image.png'))),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article news;

  const _CardBody({required this.news});

  @override
  Widget build(BuildContext context) {
    return Text((news.description != null) ? '${news.description}' : '');
  }
}
