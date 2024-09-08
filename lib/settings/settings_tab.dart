import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppTheme.black,
                  fontSize: 14,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppTheme.white,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                )),
            child: DropdownButton<String>(
              value: settingsProvider.language,
              isExpanded: true,
              underline: const SizedBox(),
              iconEnabledColor: Theme.of(context).primaryColor,
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: Text(
                    'English',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text(
                    'العربية',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
              onChanged: (selectedLanguage) {
                if (selectedLanguage == null) return;
                settingsProvider.changLanguge(selectedLanguage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
