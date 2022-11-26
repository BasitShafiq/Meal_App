import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  MealItem({
    @required this.imageUrl,
    @required this.id,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem,
  });
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetail.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
      ;
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;

      case Complexity.Hard:
        return 'hard';
        break;

      case Complexity.Challenging:
        return 'challenging';
        break;
      default:
        return "Not Known";
    }
  }

  String get AffordibilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'afforadable';
        break;

      case Affordability.Pricey:
        return 'pricey';
        break;

      case Affordability.Luxurious:
        return 'luxurious';
        break;

      default:
        return "Not Known";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${duration}min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(AffordibilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
