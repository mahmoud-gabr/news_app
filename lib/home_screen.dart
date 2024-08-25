import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/categories_grid.dart';
import 'package:news_app/drawer/drawer_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
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
        drawer: const HomeDrawer(),
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: const CategoriesGrid(),
      ),
    );
  }
}
