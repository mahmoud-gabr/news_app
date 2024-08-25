import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    const List<CategoryModel> categories = [
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0xFFC91C22),
      ),
      CategoryModel(
        name: 'Politics',
        imageName: 'politics',
        color: Color(0xFF003E90),
      ),
      CategoryModel(
        name: 'Health',
        imageName: 'health',
        color: Color(0xFFED1E79),
      ),
      CategoryModel(
        name: 'Business',
        imageName: 'bussines',
        color: Color(0xFFCF7E48),
      ),
      CategoryModel(
        name: 'Environment',
        imageName: 'environment',
        color: Color(0xFF4882CF),
      ),
      CategoryModel(
        name: 'Science',
        imageName: 'science',
        color: Color(0xFFF2D352),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category\nof interest',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppTheme.navy,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) => CategoryItem(
                index: index,
                category: categories[index],
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
