class CategoryModel {
  String name;
  String id;

  CategoryModel({required this.id, required this.name});
  static List<CategoryModel> categories = [
    CategoryModel(id: "0", name: "Action"),
    CategoryModel(id: "1", name: "Biography"),
    CategoryModel(id: "2", name: "Adventure"),
    CategoryModel(id: "3", name: "Animation"),
    CategoryModel(id: "4", name: "Sci-Fi"),
    CategoryModel(id: "5", name: "Fantasy"),
    CategoryModel(id: "6", name: "Horror"),
    CategoryModel(id: "7", name: "Comedy"),
  ];
}
