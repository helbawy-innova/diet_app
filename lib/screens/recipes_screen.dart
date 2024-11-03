import 'package:diet_planner/blocs/recipe_cubit.dart';
import 'package:diet_planner/configuration/app_routes.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/screens/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/recipe_details_cubit.dart';
import '../models/recipe_model.dart';
import '../widgets/recipe_card_view.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RecipeCubit, AppState>(
          builder: (context, state) {
            if (state is LoadingState)
              return const Center(child: CircularProgressIndicator());
            else if (state is ErrorState)
              return Center(child: Text(state.message));
            else if (state is EmptyState)
              return Center(child: Text('No recipes available'));
            else if (state is LoadedState) {
              List<RecipeModel> recipesList = state.data as List<RecipeModel>;
              return ListView.separated(
                padding: const EdgeInsets.all(24),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.recipeDetails,
                      arguments: recipesList[index].id,
                    );
                  },
                  child: RecipeCardView(
                    recipeModel: recipesList[index],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: recipesList.length,
              );
            } else
              return const SizedBox();
          },
        ),
      ),
    );
  }
}
