import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final affordability;
  final complexity;

  MealItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.affordability,
      this.complexity});

  // function to return the difficulty of the enum
  String get complexityText {
    switch (complexity) {
      // 'switch' statement can be used in instances where there are lots of conditions, or want to combine conditions
      case Complexity
          .Simple: // if the meal is 'simple' to make, return 'simple'
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default: // 'base' case if required, used here for error handling
        return 'Unknown';
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
    }
  }

  @override
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        // tappable widget displayed on the meals screen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin:
            EdgeInsets.all(10), // how much space to we want around the card?
        child: Column(
          children: <Widget>[
            // store content in the card
            Stack(
              // show multiple elements on top of each other
              children: <Widget>[
                // widget to force children into specific shapes e.g. rectangle with curved borders
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // positioned widget used in stacks to determin where child widgets are positioned
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // text wrapped if it's too long
                      overflow: TextOverflow
                          .fade, // text will fade if it's moves over the boundary
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(AffordabilityText),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
