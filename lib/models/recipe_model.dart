class RecipeModel{
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  RecipeModel({required this.id,required this.name, required this.description, required this.imageUrl});
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json["id"],
      name: json["title"],
      description: "",
      imageUrl: json["image"],
    );
  }
}