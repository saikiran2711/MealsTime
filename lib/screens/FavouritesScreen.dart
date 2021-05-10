import 'package:flutter/material.dart';
import 'package:mealstime/models/meal.dart';
import 'package:mealstime/widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> _favs;
  FavouritesScreen(this._favs);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget._favs.length == 0)
        ? Center(
            child: Text(
            "No favourites added yet !",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold),
          ))
        : ListView.builder(
            itemBuilder: (_, index) {
              return MealItem(
                id: widget._favs[index].id,
                title: widget._favs[index].title,
                imageUrl: widget._favs[index].imageUrl,
                affordability: widget._favs[index].affordability,
                complexity: widget._favs[index].complexity,
                duration: widget._favs[index].duration,
                ingredients: widget._favs[index].ingredients,
                steps: widget._favs[index].steps,
                isFav: widget._favs[index].isFav,
              );
            },
            itemCount: widget._favs.length,
          );
  }
}
