import 'package:flutter/material.dart';

import '../Widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    // declare values from route instead of using a constructor
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
        String>; // declare how the arguments are declared in the navigator class
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final displayedMeals = DUMMY_MEALS.where((meal) {
      // return only the meals in the correct category using where.()
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // display the filtered meals, using the meal item class
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ), // number of items == number of meals in correct category
    );
  }
}
