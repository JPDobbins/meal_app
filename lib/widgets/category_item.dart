import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

/// create a category widget from the category model

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  // method to send the user to the appropriate page
  void selectCategory(BuildContext ctx) {
    // navigator class implements a stack data structure to store the pages that we visit
    // user is navigated to the screen declared in the main file, with the required arguments declared here
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // widget similar to gesture detector but also gives off 'ripple effect' when pressed
      onTap: () => selectCategory(
          context), // trigger the method declared above to navigate to new screen
      splashColor: Theme.of(context).primaryColor, // color of the ripple
      borderRadius: BorderRadius.circular(
          15), // shape of the ripple. If a border radius is declared for the container widget, these should then match
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
          ),
        ),
      ),
    );
  }
}
