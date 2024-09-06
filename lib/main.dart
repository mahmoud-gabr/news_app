import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:news_app/search/search_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewsDetailsScreen.routeName:(_) => const NewsDetailsScreen(),
        SearchScreen.routeName:(_) => const SearchScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
