import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class CustoumTextField extends StatelessWidget {
  const CustoumTextField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppTheme.primary,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppTheme.black,
              fontSize: 18,
            ),
        decoration: InputDecoration(
          hintText: 'Search Article',
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppTheme.primary.withOpacity(.4),
              ),
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: AppTheme.primary,
            ),
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: AppTheme.primary,
          ),
        ),
      ),
    );
  }
}
