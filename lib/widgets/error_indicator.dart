import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Somthing Went Wrong!',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.black,
            ),
      ),
    );
  }
}
