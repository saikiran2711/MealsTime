import "package:flutter/material.dart";
import 'package:mealstime/models/meal.dart';
import 'package:mealstime/widgets/meal_item.dart';

class CategoryRecepie extends StatefulWidget {
  final List<Meal> meals;
  CategoryRecepie(this.meals);

  @override
  _CategoryRecepieState createState() => _CategoryRecepieState();
}

class _CategoryRecepieState extends State<CategoryRecepie> {
  @override
  Widget build(BuildContext context) {
    final recepies =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = recepies['title'];
    final id = recepies['id'];
    final catMeals = widget.meals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          "$title Recepies",
          style: TextStyle(
              fontSize: 24, fontFamily: "Raleway", fontWeight: FontWeight.w500),
        ),
      ),
      // ignore: missing_return
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: catMeals[index].id,
            title: catMeals[index].title,
            imageUrl: catMeals[index].imageUrl,
            affordability: catMeals[index].affordability,
            complexity: catMeals[index].complexity,
            duration: catMeals[index].duration,
            ingredients: catMeals[index].ingredients,
            steps: catMeals[index].steps,
            isFav: catMeals[index].isFav,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
