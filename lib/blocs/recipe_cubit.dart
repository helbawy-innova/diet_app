import 'dart:developer';

import 'package:diet_planner/configuration/app_end_points.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/models/recipe_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCubit extends Cubit<AppState> {
  RecipeCubit() : super(LoadingState()) {
    getRecipes();
  }

  //===========================
  //=========================== Variables
  //===========================
  List<RecipeModel> recipesList = [];

  //===========================
  //=========================== Functions
  //===========================
  getRecipes() async {
    emit(LoadingState());
    try {
      await _requestRecipes();
      emit(LoadedState(recipesList));
    } catch (e) {
      log(e.toString());
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> _requestRecipes() async {
    Dio dio = Dio();
    Response response = await dio.post(
      "http://fakerestapi.azurewebsites.net/api/v1/Authors",
      data: {
        "Id":101,
        "idBook":101,
        "firstName": "Ahmed",
        "lastName": "Nouh"
      },
    );
    log(response.statusCode.toString());
    log(response.data.toString());
    if(response.statusCode != 200){
      throw Exception("Failed to load recipes");
    }
    // Dio dio = Dio();
    // Response response = await dio.get(AppEndPoints.recipesSearch, queryParameters: {
    //   "apiKey": "9b9990c9739346e58bba1c74545ccbdc",
    // });
    // log(response.statusCode.toString());
    // Map data = response.data;
    // data["results"].forEach(
    //   (recipe) {
    //     recipesList.add(RecipeModel.fromJson(recipe));
    //   },
    // );
    // return recipesList;
  }
}
