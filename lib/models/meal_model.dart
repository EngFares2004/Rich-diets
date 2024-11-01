class MealModel{
  int id;
  String name;
  String description;
  String image;
  num price=0;
  int quantity = 1;
  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,

  });
}