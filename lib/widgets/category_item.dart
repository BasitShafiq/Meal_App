import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    void selectCategory() {
      Navigator.of(context).pushNamed(CategoryMealScreen.routeName, arguments: {
        'id': id,
        'title': title,
        'color': color,
      });
    }

    return InkWell(
      onTap: () {
        selectCategory();
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.6), color],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
