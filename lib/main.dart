import 'package:diet_planner/blocs/cart_bloc.dart';
import 'package:diet_planner/blocs/recipe_cubit.dart';
import 'package:diet_planner/models/recipe_model.dart';
import 'package:diet_planner/screens/cart_screen.dart';
import 'package:diet_planner/screens/home_screen.dart';
import 'package:diet_planner/screens/order_confirm_screen.dart';
import 'package:diet_planner/screens/recipe_details.dart';
import 'package:diet_planner/screens/recipes_screen.dart';
import 'package:diet_planner/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/recipe_details_cubit.dart';
import 'configuration/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.splash,
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
