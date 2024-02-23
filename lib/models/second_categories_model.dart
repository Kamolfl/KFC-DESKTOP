class FoodVariant {
  final String image;
  final String name;
  final int gram;
  final int calorie;
  final int price;
  final String? ingredient;
  final List<AddIngredients>? addIngredients;

  FoodVariant({this.ingredient, this.addIngredients, required this.image, required this.name, required this.gram, required this.calorie, required this.price});
}

class AddIngredients {
  final String? igdName;
  final int? igdPrice;

  AddIngredients({this.igdName, this.igdPrice});
}

class SecondCategoriesModel {
  final String text;
  final List<FoodVariant> foodVariants;
  final bool? newFood;
  final String image;

  SecondCategoriesModel({required this.text, required this.foodVariants, this.newFood, required this.image});
}

List<SecondCategoriesModel> model = [
  SecondCategoriesModel(
    text: 'АКЦИИ',
    image: 'assets/images/sale.png',
    foodVariants: [
      FoodVariant(image: 'assets/images/sale.png', name: 'Чёрный бургер', gram: 301, calorie: 501, price: 221),
    ],
  ),

  SecondCategoriesModel(
    text: 'ПИЦЦА',
    image: 'assets/images/pizza.png',
    foodVariants: [
      FoodVariant(image: 'assets/images/pizza1.png', name: 'Пепперони', gram: 350, calorie: 600, price: 280, ingredient: 'Майонез'),
      FoodVariant(image: 'assets/images/pizza2.png', name: 'Маргарита', gram: 351, calorie: 601, price: 281),
    ],
  ),
  // SecondCategoriesModel(
  //   text: 'БУРГЕРЫ',
  //   image: 'assets/images/burger.jpeg',
  //   foodVariants: [
  //     FoodVariant(image: 'assets/images/burger1.png', name: '«Дон-бекон»', gram: 300, calorie: 500, price: 220),
  //     FoodVariant(image: 'assets/images/burger2.png', name: '«wfkjgkug»', gram: 301, calorie: 501, price: 221),
  //     FoodVariant(image: 'assets/images/burger3.png', name: '«KJJCHXHFXHCJ', gram: 302, calorie: 502, price: 222),
  //   ],
  // ),
  // SecondCategoriesModel(
  //   text: 'НАПИТКИ',
  //   image: 'assets/images/drinks.png',
  //   foodVariants: [
  //     FoodVariant(image: 'assets/images/nestle.png', name: ' Нестле', gram: 304, calorie: 504, price: 224),
  //     FoodVariant(image: 'assets/images/fanta.png', name: 'Фанта', gram: 305, calorie: 505, price: 225),
  //     FoodVariant(image: 'assets/images/sprite.png', name: 'Спрайт', gram: 306, calorie: 506, price: 226),
  //     FoodVariant(image: 'assets/images/bonaqua.png', name: 'Бонакуа', gram: 307, calorie: 507, price: 227),
  //   ],
  // ),
  // SecondCategoriesModel(
  //   text: 'САЛАТЫ',
  //   image: 'assets/images/salads.png',
  //   foodVariants: [
  //     FoodVariant(image: 'assets/images/salad1.png', name: 'Цезарь', gram: 200, calorie: 350, price: 150),
  //     FoodVariant(image: 'assets/images/salad2.png', name: 'Цеуцлапзарь', gram: 201, calorie: 351, price: 151),
  //     FoodVariant(image: 'assets/images/salad3.png', name: 'цулапц', gram: 202, calorie: 352, price: 152),
  //     FoodVariant(image: 'assets/images/salad4.png', name: 'ДОУАКДЛ', gram: 203, calorie: 353, price: 153),
  //     FoodVariant(image: 'assets/images/salad5.png', name: 'аулгп', gram: 204, calorie: 354, price: 154),
  //   ],
  // ),
  // SecondCategoriesModel(
  //   text: 'ЗАКУСКИ',
  //   image: 'assets/images/snacks.png',
  //   foodVariants: [
  //     FoodVariant(image: 'assets/images/snacks1.png', name: 'Картофель фри', gram: 150, calorie: 250, price: 120),
  //     FoodVariant(image: 'assets/images/snacks2.png', name: 'ДЦЛПААУЦЦАУЦУА', gram: 151, calorie: 251, price: 121),
  //     FoodVariant(image: 'assets/images/snacks3.png', name: 'АЦЛЦЙАУ', gram: 152, calorie: 252, price: 122),
  //     FoodVariant(image: 'assets/images/snacks4.png', name: 'лыкпалпцуацлгп', gram: 153, calorie: 253, price: 123),
  //     FoodVariant(image: 'assets/images/snacks5.png', name: 'уцаоп', gram: 154, calorie: 254, price: 124),
  //     FoodVariant(image: 'assets/images/snacks6.png', name: 'уцлйплпфри', gram: 155, calorie: 255, price: 125),
  //   ],
  // ),
  SecondCategoriesModel(
    text: 'ДЕСЕРТЫ',
    image: 'assets/images/deserts.png',
    foodVariants: [
      FoodVariant(image: 'assets/images/desert1.png', name: 'Шоколадный торт', gram: 250, calorie: 400, price: 180,
        addIngredients: [
          AddIngredients(igdName: 'Бекон', igdPrice: 10),
          AddIngredients(igdName: 'Сыр', igdPrice: 15),
          AddIngredients(igdName: 'Халапеньо', igdPrice: 12),
        ],
      ),
      FoodVariant(image: 'assets/images/desert2.png', name: 'fewqkhfy торт', gram: 251, calorie: 401, price: 181,
        addIngredients: [
          AddIngredients(igdName: 'Соус', igdPrice: 8),
          AddIngredients(igdName: 'Кетчуп', igdPrice: 5),
          AddIngredients(igdName: 'Файонез', igdPrice: 7),
        ],
      ),
      FoodVariant(image: 'assets/images/desert3.png', name: 'ЦКПЦДКАЭДШН', gram: 252, calorie: 402, price: 182,
        addIngredients: [
          AddIngredients(igdName: 'Моус', igdPrice: 1),
          AddIngredients(igdName: 'Сетчуп', igdPrice: 2),
          AddIngredients(igdName: 'Пайонез', igdPrice: 3),
        ],
      ),
      FoodVariant(image: 'assets/images/desert4.png', name: 'УЦАДЛГ', gram: 253, calorie: 403, price: 183, ingredient: 'Майонез'),
      FoodVariant(image: 'assets/images/desert5.png', name: 'WLUQYTUTIUTIWEF', gram: 254, calorie: 404, price: 184,
        addIngredients: [
          AddIngredients(igdName: 'Бекон', igdPrice: 10),
          AddIngredients(igdName: 'Сыр', igdPrice: 15),
          AddIngredients(igdName: 'Халапеньо', igdPrice: 12),
        ],
      ),
      FoodVariant(image: 'assets/images/desert6.png', name: 'wkfgkkwefk', gram: 255, calorie: 405, price: 185, ingredient: 'Майонез'),
      FoodVariant(image: 'assets/images/desert7.png', name: 'fwlkuЛГпуца', gram: 256, calorie: 406, price: 186),
    ],
  ),
];
