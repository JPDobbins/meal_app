import 'package:flutter/material.dart';

/// defining a category class that we can instanciate later

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    // const used to make sure the data in each object can't be changed
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
