import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});
  final void Function(DrawerItem) onItemSelected;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * .7,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: screenSize.height * .2,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                top: 12,
                start: 12,
              ),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Categories',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 24,
                                    color: AppTheme.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Settings',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 24,
                                    color: AppTheme.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  settings,
  categories;
}
