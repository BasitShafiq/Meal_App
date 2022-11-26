import 'package:flutter/material.dart';
import 'package:mealapp/screens/Categories_Screen.dart';
import 'package:mealapp/screens/category_meal_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import '../screens/favourites.dart';
import '../screens/filter_screen.dart';

class SideDrawer extends StatelessWidget {
  Widget buildListTiles(String title, IconData icon, Function tap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'CooKing Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          buildListTiles(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          buildListTiles(
            'Filter',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(Filter.routeName);
            },
          ),
        ],
      ),
    );
  }
}
