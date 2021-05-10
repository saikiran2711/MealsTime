import "package:flutter/material.dart";
import 'package:mealstime/models/meal.dart';
import 'package:mealstime/widgets/steps_ingredients.dart';

class MeatDetail extends StatefulWidget {
  final Function _toggleFav;
  final List<Meal> _favourites;
  MeatDetail(this._toggleFav, this._favourites);
  @override
  _MeatDetailState createState() => _MeatDetailState();
}

class _MeatDetailState extends State<MeatDetail> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = widget._favourites.firstWhere((meal) {
      return meal.id == id;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(
              fontSize: 24, fontFamily: "Raleway", fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // margin: EdgeInsets.symmetric(vertical: 10),
              height: 250,
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.only(bottom: 5),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                elevation: 4,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5)),
              ),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ingredients",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600),
            ),
            ingredientsList(context, meal),
            SizedBox(
              height: 5,
            ),
            Text(
              "Steps to make",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600),
            ),
            stepsList(context, meal),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.pink,
        child: (meal.isFav == true)
            ? Icon(
                Icons.star,
                size: 30,
                color: Colors.amber,
              )
            : Icon(
                Icons.star,
                size: 30,
                color: Colors.white,
              ),
        onPressed: () {
          widget._toggleFav(meal.id);
        },
      ),
    );
  }
}
