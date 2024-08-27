import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/categories_grid.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_model.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: selecredCategory != null
            ? CategoryDetails(selecredCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selecredCategory;
  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selecredCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }

  void onCategorySelected(CategoryModel category) {
    selecredCategory = category;
    setState(() {});
  }
}
