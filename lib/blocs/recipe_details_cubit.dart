import 'package:diet_planner/configuration/app_end_points.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/models/recipe_details_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsCubit extends Cubit<AppState> {
  RecipeDetailsCubit({required this.recipeId}) : super(LoadingState()){
    getDetails();
  }
  //=====================================
  //===================================== Variables
  //=====================================
  RecipeDetailsModel? recipeDetailsModel;
  final int recipeId;
  //=====================================
  //===================================== Functions
  //=====================================
  Future<RecipeDetailsModel> _requestRecipeDetails(int recipeId) async {
    Dio dio = Dio();
    Response response = await dio.get(
      AppEndPoints.recipeDetails(recipeId.toString()),
      queryParameters: {
        "apiKey": "9b9990c9739346e58bba1c74545ccbdc",
      },
    );
    Map<String,dynamic> data = response.data as Map<String,dynamic>;
    return RecipeDetailsModel.fromJson(data);
  }

  //=====================================
  //===================================== Events
  //=====================================
  getDetails() async {
    emit(LoadingState());
    try {
      recipeDetailsModel = await _requestRecipeDetails(recipeId);
      emit(LoadedState(recipeDetailsModel));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
