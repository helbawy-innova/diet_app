import 'package:diet_planner/blocs/recipe_cubit.dart';
import 'package:diet_planner/screens/recipes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/recipe_details_cubit.dart';
import '../models/recipe_model.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/recipe_details.dart';
import '../screens/splash_screen.dart';

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String recipes = '/cart';
  static const String recipeDetails = '/recipeDetails';
}

_returnRoute(Widget page) => MaterialPageRoute(builder: (context) => page);

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return _returnRoute(const SplashScreen());
    case AppRoutes.home:
      return _returnRoute(const HomeScreen());
    case AppRoutes.recipes:
      return _returnRoute(
        BlocProvider(
          create: (context) => RecipeCubit(),
          child: RecipesScreen(),
        ),
      );
    case AppRoutes.recipeDetails:
      int recipeId = settings.arguments as int;
      return _returnRoute(
        BlocProvider(
          create: (context) => RecipeDetailsCubit(recipeId: recipeId),
          child: const RecipeDetails(),
        ),
      );
    default:
      return _returnRoute(
        const Scaffold(
          body: Center(
            child: Text('404'),
          ),
        ),
      );
  }
}
