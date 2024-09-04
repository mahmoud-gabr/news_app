import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});
  static const String routeName = '/NewsDetails';

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as Article;
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    final Uri url = Uri.parse(news.url ?? '');
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(news.source!.name ?? ''),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
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
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 370,
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.description ?? '',
                        style: titleSmallStyle.copyWith(
                          color: AppTheme.darkGrey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'View Full Article',
                              style: titleSmallStyle.copyWith(
                                color: AppTheme.darkGrey,
                                fontSize: 18,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_right,
                              color: AppTheme.darkGrey,
                              size: 32,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
