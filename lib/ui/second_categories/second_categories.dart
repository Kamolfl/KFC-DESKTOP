import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kfc_desktop/models/second_categories_model.dart';

class SecondCategories extends StatefulWidget {
  const SecondCategories({super.key});

  @override
  State<SecondCategories> createState() => _SecondCategoriesState();
}

class _SecondCategoriesState extends State<SecondCategories> {
  List<SecondCategoriesModel> model = [
    SecondCategoriesModel(
        newFood: true,
        text: 'АКЦИИ',
        image: 'assets/images/sale.png',
        name: 'Чёрный бургер',
        gram: 30000,
        calorie: 50000,
        price: 239),
    SecondCategoriesModel(
        text: 'ПИЦЦА',
        image: 'assets/images/sale.png',
        name: 'Дабл-гамбургер',
        gram: 300,
        calorie: 500,
        price: 220),
    SecondCategoriesModel(
        text: 'БУРГЕРЫ',
        image: 'assets/images/burger.jpeg',
        name: '«Дон-бекон»',
        gram: 300,
        calorie: 500,
        price: 220),
    SecondCategoriesModel(
        text: 'НАПИТКИ',
        image: 'assets/images/cola.jpeg',
        name: 'Чизбургер',
        gram: 300,
        calorie: 500,
        price: 220),
    SecondCategoriesModel(
        newFood: true,
        text: 'САЛАТЫ',
        image: 'assets/images/sale.png',
        name: 'Чёрный бургер',
        gram: 300,
        calorie: 500,
        price: 220),
    SecondCategoriesModel(
        text: 'ЗАКУСКИ',
        image: 'assets/images/cartofel.jpeg',
        name: 'Дабл-гамбургер',
        gram: 300,
        calorie: 500,
        price: 220),
    SecondCategoriesModel(
        text: 'ДЕСЕРТЫ',
        image: 'assets/images/sale.png',
        name: '«Дон-бекон»',
        gram: 300,
        calorie: 500,
        price: 220),
  ];

  ScrollController scrollController = ScrollController();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 220,
              child: Scrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: UnconstrainedBox(
                          child: Container(
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.deepOrange[700],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    child: Text(
                                      model[index].text,
                                      style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 150,
                                  height: 90,
                                  child: Image.asset(
                                    model[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('БУРГЕРЫ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: model.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent:
                        MediaQuery.of(context).size.height * 0.6,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.grey[200],
                          // color: Colors.white,
                          child: Stack(
                            children: [
                              Center(
                                child: UnconstrainedBox(
                                  child: Container(
                                    width: 250,
                                    height: 310,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 120),
                                          FittedBox(
                                              child: Text(
                                                model[index].name,
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900),
                                              )),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${model[index].gram} гр',
                                                style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.6),
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '${model[index].calorie} ККал',
                                                style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.6),
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          FittedBox(
                                              child: Text(
                                                '${model[index].price} ₽',
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                    width: 200,
                                    height: 150,
                                    child: Image.asset(model[index].image)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
