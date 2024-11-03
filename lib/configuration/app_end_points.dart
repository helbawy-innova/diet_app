abstract class AppEndPoints{
  static const String baseUrl = "https://api.spoonacular.com/";
  //===========================================================
  static const String recipesSearch = "${baseUrl}recipes/complexSearch";
  static String recipeDetails(String id) => "${baseUrl}recipes/$id/information";
}