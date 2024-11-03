import 'package:diet_planner/blocs/recipe_details_cubit.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/models/recipe_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecipeDetailsCubit, AppState>(
        builder: (context, state) {
          if(state is LoadingState)
            return Center(child: CircularProgressIndicator());
          else if(state is ErrorState)
            return Center(child: Text(state.message));
          else {
            RecipeDetailsModel recipeDetails = BlocProvider.of<RecipeDetailsCubit>(context).recipeDetailsModel!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        recipeDetails.imageUrl,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      SafeArea(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recipeDetails.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            height: 40,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(child: Text(recipeDetails.types[index])),
                              ),
                              separatorBuilder: (context, index) => SizedBox(width: 16),
                              itemCount: recipeDetails.types.length,
                            ),
                          ),
                        ),
                        Text(
                          recipeDetails.description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
