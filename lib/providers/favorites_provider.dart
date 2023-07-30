import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<
    List<
        Meal>> // 2-> Here the initialization of StateNotifier class is done through extending it by making our own class
{
  //this class will contain two things a) the data or the state b) the function to update that state or data
  //a -> here we will call super the main class and inside that our data in present which in this case is an empty list
  FavoritesMealsNotifier() : super([]);

  //b-> features of this class is immutable so we cannot use add or remove to update the states i.e., we cannot edit the states
  bool toggleMealFavoriteStatus(Meal meal) {
    //state here is global variable which contains the data
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier(); //passing the instance
}); // 1 -> this provider class works with another class i.e., StateNotifier Class
