import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/settings/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
     create: (_) => SettingsProvider(),
    child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewsDetailsScreen.routeName: (_) => const NewsDetailsScreen(),
        SearchScreen.routeName: (_) => const SearchScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale( Provider.of<SettingsProvider>(context).language),
    );
  }
}
