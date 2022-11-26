import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories-meal';
  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  List<Meal> categoryMealFilter;
  var _loadedData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedData) {
      final pageRouteArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      title = pageRouteArgs['title'];
      final String id = pageRouteArgs['id'];
      categoryMealFilter = widget.availableMeal.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadedData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMealFilter.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMealFilter[index].id,
            imageUrl: categoryMealFilter[index].imageUrl,
            title: categoryMealFilter[index].title,
            duration: categoryMealFilter[index].duration,
            complexity: categoryMealFilter[index].complexity,
            affordability: categoryMealFilter[index].affordability,
            removeItem: _removeItem,
          );
        },
        itemCount: categoryMealFilter.length,
      ),
    );
  }
}
