class CategoryModel {
  String vector;
  bool isSelected;
  CategoryModel({
    required this.vector,
    required this.isSelected,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        vector: 'assets/vectors/icone-cpp.svg', isSelected: false));

    categories.add(CategoryModel(
        vector: 'assets/vectors/icone-py.svg', isSelected: false));

    categories.add(CategoryModel(
        vector: 'assets/vectors/icone-flutter.svg', isSelected: false));

    categories.add(CategoryModel(
        vector: 'assets/vectors/icone-js.svg', isSelected: false));

    return categories;
  }
}
