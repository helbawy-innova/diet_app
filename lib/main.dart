import 'package:diet_planner/blocs/cart_bloc.dart';
import 'package:diet_planner/screens/cart_screen.dart';
import 'package:diet_planner/screens/home_screen.dart';
import 'package:diet_planner/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.cart: (context) => BlocProvider(create: (context) => CartBloc(), child: const CartScreen()),
      },
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
