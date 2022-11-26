import 'package:flutter/material.dart';
import '../screens/Categories_Screen.dart';
import '../screens/favourites.dart';
import '../widgets/Side_drawer.dart';
import 'package:mealapp/models/meal.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> widgetsList;
  int pageIndex = 0;

  @override
  void initState() {
    widgetsList =
        [
          {
            'title': "Category",
            'page': CategoriesScreen(),
          },
          {
            'title': "Favourite",
            'page': Favourites(widget.favouriteMeal),
          }
        ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widgetsList[pageIndex]['title'],
        ),
      ),
      drawer: SideDrawer(),
      body: widgetsList[pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: pageIndex,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: ('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: ('Favourities'),
          ),
        ],
      ),
    );
  }
}
