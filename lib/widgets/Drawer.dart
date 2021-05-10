import "package:flutter/material.dart";

class CustomDrawer extends StatelessWidget {
  void drawerTaped(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            height: 120,
            width: double.infinity,
            color: Colors.amberAccent,
            alignment: Alignment.centerLeft,
            child: Text(
              "Let's Cook !",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              drawerTaped(context, '/');
            },
            leading: Icon(
              Icons.restaurant_menu,
              size: 26,
            ),
            title: Text(
              "Meals",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              drawerTaped(context, '/settings');
            },
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
