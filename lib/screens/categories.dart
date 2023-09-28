import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  State<CategoriesScreen> createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  
    bool glutenFreeFilter = false;
    bool lactoseFreeFilter = false;
    bool vegitarianFilter = false;
    bool veganFilter = false;
  
  void getFilter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      glutenFreeFilter = prefs.getBool('glutenFreeFilter') ?? false;
      lactoseFreeFilter = prefs.getBool('lactoseFreeFilter') ?? false;
      vegitarianFilter = prefs.getBool('vegitarianFilter') ?? false;
      veganFilter = prefs.getBool('veganFilter') ?? false;
    });
    // print("\n\n$glutenFreeFilter\n\n");
  }

  @override
  void initState() {
    super.initState();
    getFilter();
  }

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();


    if (glutenFreeFilter) {
      print(glutenFreeFilter);
      filteredMeals =
          filteredMeals.where((meal) => meal.isGlutenFree == true).toList();
    }

    if (lactoseFreeFilter) {
      filteredMeals =
          filteredMeals.where((meal) => meal.isLactoseFree == true).toList();
    }

    if (vegitarianFilter) {
      filteredMeals =
          filteredMeals.where((meal) => meal.isVegetarian == true).toList();
    }

    if (veganFilter) {
      filteredMeals =
          filteredMeals.where((meal) => meal.isVegan == true).toList();
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          isCategoryScreen: true,
          refresh: () {},
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    getFilter();
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
 