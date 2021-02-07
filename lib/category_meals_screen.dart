import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    // declare values from route instead of using a constructor
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
        String>; // declare how the arguments are declared in the navigator class
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The recipes for the category!',
        ),
      ),
    );
  }
}
