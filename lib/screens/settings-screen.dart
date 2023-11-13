import 'package:application_sus/config/categories-data.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CategoriesData.categoriesList.length,
      itemBuilder: (context, index) {
        final category = CategoriesData.categoriesList[index];
        return ListTile(
          title: Text(category),
        );
      },
    );
  }
}
