import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function toogle;
  final Function mealAdded;
  MealDetail(this.toogle, this.mealAdded);
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => mealId == element.id);

    Widget ContainerTitle(str) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          str,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget listDecoration(listBuilder) {
      return Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: listBuilder);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ContainerTitle("Ingredients"),
            listDecoration(
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Text(selectedMeal.ingredients[index]),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            ContainerTitle("Steps"),
            Container(
              height: 400,
              child: listDecoration(
                ListView.builder(
                  itemBuilder: ((context, index) => Card(
                          child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ))),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(mealAdded(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toogle(mealId);
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     Navigator.of(context).pop(mealId);
      //   },
      // ),
    );
  }
}
