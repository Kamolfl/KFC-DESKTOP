class CategoriesModel {
  final String title;
  final int? price;
  final int position;

  CategoriesModel({required this.title, this.price, required this.position});
}

List<CategoriesModel> categories = [
  CategoriesModel(title: 'СОЧНЫЕ БУРГЕРЫ', price: 120, position: 8),
  CategoriesModel(title: 'ГОРЯЧАЯ ПИЦЦА', price: 249, position: 6),
  CategoriesModel(title: 'СВЕЖЫЕ САЛАТЫ', price: 109, position: 2),
  CategoriesModel(title: 'НАПИТКИ', price: 49, position: 5),
  CategoriesModel(title: 'АКЦИИ', position: 8),
  CategoriesModel(title: 'СОЧНЫЕ БУРГЕРЫ', price: 120, position: 8),
  CategoriesModel(title: 'ГОРЯЧАЯ ПИЦЦА', price: 249, position: 6),
  CategoriesModel(title: 'СВЕЖЫЕ САЛАТЫ', price: 109, position: 2),
  CategoriesModel(title: 'НАПИТКИ', price: 49, position: 5),
  CategoriesModel(title: 'АКЦИИ', position: 8),
];