import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:kfc_desktop/models/categories_model.dart';
import 'package:kfc_desktop/ui/categories/categories.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final deviceInfoPlugin = DeviceInfoPlugin();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 1920,
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('КАТЕГОРИИ',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ComboScreen(),
                    const SizedBox(height: 10),
                    CategoriesGridScreen(categories: categories),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kfc_desktop/models/second_categories_model.dart';
//
// class SecondCategories extends StatefulWidget {
//   const SecondCategories({super.key});
//
//   @override
//   State<SecondCategories> createState() => _SecondCategoriesState();
// }
//
// class _SecondCategoriesState extends State<SecondCategories> {
//   List<SecondCategoriesModel> model = [
//     SecondCategoriesModel(
//         newFood: true,
//         text: 'АКЦИИ',
//         image: 'assets/images/sale.png',
//         name: 'Чёрный бургер',
//         gram: 300,
//         calorie: 500,
//         price: 239),
//     SecondCategoriesModel(
//         text: 'ПИЦЦА',
//         image: 'assets/images/sale.png',
//         name: 'Дабл-гамбургер',
//         gram: 300,
//         calorie: 500,
//         price: 220),
//     SecondCategoriesModel(
//         text: 'БУРГЕРЫ',
//         image: 'assets/images/burger.jpeg',
//         name: '«Дон-бекон»',
//         gram: 300,
//         calorie: 500,
//         price: 220),
//     SecondCategoriesModel(
//         text: 'НАПИТКИ',
//         image: 'assets/images/cola.jpeg',
//         name: 'Чизбургер',
//         gram: 300,
//         calorie: 500,
//         price: 220),
//     SecondCategoriesModel(
//         newFood: true,
//         text: 'САЛАТЫ',
//         image: 'assets/images/sale.png',
//         name: 'Чёрный бургер',
//         gram: 300,
//         calorie: 500,
//         price: 220),
//     SecondCategoriesModel(
//         text: 'ЗАКУСКИ',
//         image: 'assets/images/cartofel.jpeg',
//         name: 'Дабл-гамбургер',
//         gram: 300,
//         calorie: 500,
//         price: 220),
//     SecondCategoriesModel(
//         text: 'ДЕСЕРТЫ',
//         image: 'assets/images/sale.png',
//         name: '«Дон-бекон»',
//         gram: 300,
//         calorie: 500,
//         price: 220),
//   ];
//
//   ScrollController scrollController = ScrollController();
//
//   int selectedIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: 220,
//               child: Scrollbar(
//                 controller: scrollController,
//                 child: ListView.builder(
//                   controller: scrollController,
//                   itemCount: model.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: UnconstrainedBox(
//                           child: Container(
//                             width: 170,
//                             height: 170,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: selectedIndex == index
//                                   ? Colors.black
//                                   : Colors.deepOrange[700],
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: FittedBox(
//                                     child: Text(
//                                       model[index].text,
//                                       style: const TextStyle(
//                                           fontSize: 30,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 SizedBox(
//                                   width: 150,
//                                   height: 90,
//                                   child: Image.asset(
//                                     model[index].image,
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 20),
//                     child: Text('БУРГЕРЫ',
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold)),
//                   ),
//                   Expanded(
//                     child: GridView.builder(
//                       padding: const EdgeInsets.all(20),
//                       itemCount: model.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         mainAxisExtent:
//                         MediaQuery.of(context).size.height * 0.6,
//                       ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           // color: Colors.grey[200],
//                           color: Colors.white,
//                           child: Stack(
//                             children: [
//                               Center(
//                                 child: UnconstrainedBox(
//                                   child: Container(
//                                     width: 250,
//                                     height: 310,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                   alignment: Alignment.topCenter,
//                                   child: Stack(
//                                     children: [
//                                       Container(
//                                           width: 220,
//                                           height: 150,
//                                           child: Image.asset(model[index].image)),
//                                     ],
//                                   )),
//                               Positioned(
//                                 top: 170,
//                                 left: 30,
//                                 child: Container(
//                                   width: 200,
//                                   child: FittedBox(
//                                     fit: BoxFit.scaleDown,
//                                     child: Text(
//                                       model[index].name,
//                                       style: const TextStyle(
//                                           fontSize: 30,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 120,
//                                 left: 30,
//                                 child: Text(
//                                   '${model[index].gram} гр',
//                                   style: TextStyle(
//                                       color: Colors.grey.withOpacity(0.6),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 120,
//                                 right: 30,
//                                 child: Text(
//                                   '${model[index].calorie} ККал',
//                                   style: TextStyle(
//                                       color: Colors.grey.withOpacity(0.6),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 40,
//                                 left: 30,
//                                 child: Text(
//                                   '${model[index].price} ₽',
//                                   style: const TextStyle(
//                                       fontSize: 50,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
