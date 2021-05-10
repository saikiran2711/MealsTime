import 'package:flutter/material.dart';
import 'package:mealstime/models/meal.dart';

Widget ingredientsList(BuildContext context, Meal meal) {
  return Container(
    height: 200,
    width: 300,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    child: ListView.builder(
      itemBuilder: (_, index) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber[300]),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: Text(
              meal.ingredients[index],
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontFamily: "RobotoCondensed"),
            ));
      },
      itemCount: meal.ingredients.length,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.pink[300]),
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

Widget stepsList(BuildContext context, Meal meal) {
  return Container(
    height: 300,
    width: double.infinity,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    child: ListView.builder(
      itemBuilder: (_, index) {
        return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.pink[300]),
              ),
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: Text(
              "${index + 1}. " + meal.steps[index],
              style: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
            ));
      },
      itemCount: meal.steps.length,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.pink[300]),
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
