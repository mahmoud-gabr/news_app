import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/custoum_text_field.dart';
import 'package:news_app/news/view/widgets/search_news_list.dart';
import 'package:news_app/shared/app_theme.dart';


class SearchScreen extends StatefulWidget {
  static String routeName = '/SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: CustoumTextField(
            controller: searchController,
            onChanged: (value) {
              searchController.text = value;
              setState(() {});
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: SearchNewsList(
          searchKey: searchController.text,
        ),
      ),
    );
  }
}
