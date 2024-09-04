import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final Article news;
  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            NewsDetailsScreen.routeName,
            arguments: news,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                news.urlToImage ??
                    'http://www.palmares.lemondeduchiffre.fr/images/joomlart/demo/default.jpg',
                height: MediaQuery.of(context).size.height * .25,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              news.source?.name ?? '',
              style: titleSmallStyle!.copyWith(
                fontSize: 10,
                color: AppTheme.grey,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              news.title ?? '',
              style: titleSmallStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                timeago.format(
                  news.publishedAt ?? DateTime(1),
                ),
                style: titleSmallStyle.copyWith(
                  fontSize: 13,
                  color: AppTheme.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
