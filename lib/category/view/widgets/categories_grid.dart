import 'package:flutter/material.dart';
import 'package:news_app/category/view/widgets/category_item.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/category/data/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    const List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0xFFC91C22),
      ),
      CategoryModel(
        id: 'general',
        name: 'General',
        imageName: 'politics',
        color: Color(0xFF003E90),
      ),
      CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: Color(0xFFED1E79),
      ),
      CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'bussines',
        color: Color(0xFFCF7E48),
      ),
      CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        imageName: 'environment',
        color: Color(0xFF4882CF),
      ),
      CategoryModel(
        id: 'science',
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
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () => onCategorySelected(category),
                  child: CategoryItem(
                    index: index,
                    category: category,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
