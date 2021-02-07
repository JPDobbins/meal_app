import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import './models/category.dart';
import './category_item.dart';

/// file to handle what will be displayed on the categories screen

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Josh\'s meals app'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // defining layout of the grid
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ));
  }
}
