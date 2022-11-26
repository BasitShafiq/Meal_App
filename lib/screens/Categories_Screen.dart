import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = '/category';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      children: DUMMY_CATEGORIES.map((catItem) {
        return CategoryItem(
            id: catItem.id, title: catItem.title, color: catItem.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
