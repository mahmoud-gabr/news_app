import 'package:flutter/material.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/tabs/tab_item.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {super.key});
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;
  final List<String> sources = List.generate(10, (index) => 'source $index');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            onTap: (index) => setState(() => selectedIndex = index),
            tabs: sources
                .map(
                  (source) => TabItem(
                    isSelected: sources.indexOf(source) == selectedIndex,
                    source: source,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const NewsItem(),
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
