import 'package:flutter/material.dart';
import 'package:mealstime/models/meal.dart';
import 'package:mealstime/widgets/Drawer.dart';
import './categories.dart';
import './FavouritesScreen.dart';

class BottomNav extends StatefulWidget {
  final List<Meal> _favs;
  BottomNav(this._favs);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Map<String, Object>> _screenSelected;

  @override
  void initState() {
    _screenSelected = [
      {"screen": CategoriesScreen(), "title": "Dish Meals"},
      {"screen": FavouritesScreen(widget._favs), "title": "Favourites"},
    ];
    super.initState();
  }

  int _tabIndex = 0;

  void _tabSelect(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          _screenSelected[_tabIndex]['title'],
          style: TextStyle(
              fontSize: 24, fontFamily: "Raleway", fontWeight: FontWeight.w500),
        ),
      ),
      drawer: CustomDrawer(),
      body: _screenSelected[_tabIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _tabSelect,
        currentIndex: _tabIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber[400],
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
