class Recipe {
  List ingredients;
  String name;

  Recipe({required this.ingredients, required this.name});

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(
      ingredients: json['ingredients'],
      name: json['name'],
    );
  }
}
