import "package:flutter/material.dart";
import 'package:mealstime/widgets/Drawer.dart';

class SettingScreen extends StatefulWidget {
  final Function _updateFilters;
  final Map<String, bool> _filters;

  SettingScreen(this._filters, this._updateFilters);
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget._filters['gluten'];
    _lactoseFree = widget._filters["lactose"];
    _vegan = widget._filters["vegan"];
    _vegetarian = widget._filters["vegetarian"];

    super.initState();
  }

  Widget buildList(
      String title, bool oldvalue, String subtitle, Function selected) {
    return SwitchListTile(
      activeColor: Colors.pink[300],
      title: Text(title,
          style: TextStyle(
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w700)),
      value: oldvalue,
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      onChanged: selected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final changes = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget._updateFilters(changes);
            },
          ),
        ],
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 24, fontFamily: "Raleway", fontWeight: FontWeight.w500),
        ),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Change your diet plan here",
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildList("Glutten-Free", _glutenFree,
                      "Only include gluten free meals", (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  }),
                  Divider(
                    color: Colors.black54,
                  ),
                  buildList("Lactose-Free", _lactoseFree,
                      "Only include lactose free meals", (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  }),
                  Divider(
                    color: Colors.black54,
                  ),
                  buildList("Vegan meals", _vegan, "Only include vegan  meals",
                      (value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                  Divider(
                    color: Colors.black54,
                  ),
                  buildList("Vegetarian meals", _vegetarian,
                      "Only include vegetarain meals", (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
