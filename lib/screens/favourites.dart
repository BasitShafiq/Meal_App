import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeal;
  Favourites(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text("No Favourites yet! Add one"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
