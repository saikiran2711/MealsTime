import 'package:flutter/material.dart';
import 'package:mealstime/dummy.dart';
import 'package:mealstime/screens/bottom_navigation.dart';
import 'package:mealstime/screens/meal_description.dart';
import 'package:mealstime/screens/settings.dart';
import './screens/category_recepies.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> _meal = DUMMY_MEALS;

  void _updatefilters(Map<String, bool> updFilter) {
    setState(() {
      _filters = updFilter;

      _meal = DUMMY_MEALS.where((m) {
        if (_filters['gluten'] && !m.isGlutenFree) return false;
        if (_filters['lactose'] && !m.isLactoseFree) return false;
        if (_filters['vegan'] && !m.isVegan) return false;
        if (_filters['vegetarian'] && !m.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  List<Meal> _favourite = DUMMY_MEALS;

  List<Meal> _favs = [];

  void _toggleFav(String id) {
    setState(() {
      var meal = DUMMY_MEALS.firstWhere((ele) {
        return ele.id == id;
      });
      if (_favs.isEmpty || !_favs.contains(meal)) {
        _favs.add(meal);
        _favourite.remove(meal);
        meal.isFav = true;
        _favourite.add(meal);
      } else if (_favs.contains(meal)) {
        _favs.remove(meal);
        _favourite.remove(meal);
        meal.isFav = false;
        _favourite.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink[400],
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (_) => BottomNav(_favs),
        '/receipes': (_) => CategoryRecepie(_meal),
        '/meal-desc': (_) => MeatDetail(_toggleFav, _favourite),
        '/settings': (_) => SettingScreen(_filters, _updatefilters),
      },
    );
  }
}
