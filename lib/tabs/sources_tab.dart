import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response/source.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/tabs/tab_item.dart';

class SourcesTab extends StatefulWidget {
  const SourcesTab({super.key, required this.sources});
  final List<Source> sources;
  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            onTap: (index) => setState(() => selectedIndex = index),
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    isSelected: widget.sources.indexOf(source) == selectedIndex,
                    source: source.name ?? '',
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(sourceId: widget.sources[selectedIndex].id ?? ''),
        )
      ],
    );
  }
}
