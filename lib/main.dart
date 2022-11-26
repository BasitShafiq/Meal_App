import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import '../screens/filter_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import 'screens/Categories_Screen.dart';
import 'screens/category_meal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];
  void _setFilter(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['glutten'] && !meal.isGlutenFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toogleFavourite(String mealID) {
    final index = _favouriteMeal.indexWhere((meal) => meal.id == mealID);
    if (index >= 0) {
      setState(() {
        _favouriteMeal.removeAt(index);
      });
    } else {
      setState(() {
        _favouriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealID),
        );
      });
    }
  }

  bool _isMealAdded(String id) {
    return _favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DealsOnMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ))),
      home: SplashScreen(),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        TabsScreen.routeName: (context) => TabsScreen(_favouriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeal),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toogleFavourite, _isMealAdded),
        Filter.routeName: (ctx) => Filter(_setFilter),
      },
      //initialRoute: '/', defualt is /
      // routes: {
      //   '/': (ctx) => CategoriesScreen(),
      //   CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      // },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute: (setings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // });
    );
  }
}
