import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'))),
      home:
          CategoriesScreen(), // home argument is the entry point, or root, screen of the app
      // routes map holding the routes to the pages we have available.
      // the key is the name of the route, the value is the file (screen) that we want the use directed to
      initialRoute: '/', // route for home page
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
