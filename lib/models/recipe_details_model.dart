class RecipeDetailsModel{
  String title;
  String imageUrl;
  String description;
  List<String> types;

  RecipeDetailsModel({required this.title, required this.imageUrl, required this.description, required this.types});

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json){
    List<String> types = [];
    if(json["dishTypes"] != null){
      types = List<String>.from(json["dishTypes"]);
    }
    return RecipeDetailsModel(
      title: json["title"],
      imageUrl: json["image"],
      description: json["summary"],
      types: types,
    );
  }
}