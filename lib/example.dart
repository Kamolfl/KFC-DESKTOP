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


// import 'package:flutter/material.dart';
// import 'package:add_to_cart_animation/add_to_cart_animation.dart';
// import 'package:kfc_desktop/models/second_categories_model.dart';
// import 'package:kfc_desktop/ui/second_categories/second_categories_listview.dart';
//
// class SecondCategories extends StatefulWidget {
//   const SecondCategories({super.key});
//
//   @override
//   State<SecondCategories> createState() => _SecondCategoriesState();
// }
//
// class _SecondCategoriesState extends State<SecondCategories> {
//   GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
//   late Function(GlobalKey) runAddToCartAnimation;
//   int _cartQuantityItems = 0;
//
//   ScrollController scrollController = ScrollController();
//
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AddToCartAnimation(
//       cartKey: cartKey,
//       height: 30,
//       width: 30,
//       opacity: 0.85,
//       dragAnimation: const DragToCartAnimationOptions(
//         rotation: true,
//       ),
//       jumpAnimation: const JumpAnimationOptions(),
//       createAddToCartAnimation: (runAddToCartAnimation) {
//         this.runAddToCartAnimation = runAddToCartAnimation;
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   SecondCategoriesListView(scrollController: scrollController, secondCategoriesModel: model, selectedIndex: selectedIndex, onItemSelected: (index) {
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                   }),
//                   Expanded(
//                     child: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Text(model[selectedIndex].text,
//                                 style: const TextStyle(
//                                     fontSize: 30, fontWeight: FontWeight.bold)),
//                           ),
//                           Expanded(
//                             child: GridView.builder(
//                               padding: const EdgeInsets.all(20),
//                               itemCount: model[selectedIndex].foodVariants.length,
//                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3,
//                                 crossAxisSpacing: 10,
//                                 mainAxisSpacing: 10,
//                                 mainAxisExtent: MediaQuery.of(context).size.height * 0.6,
//                               ),
//                               itemBuilder: (BuildContext context, int index) {
//                                 GlobalKey widgetKey = GlobalKey();
//                                 return Container(
//                                   color: Colors.grey[100],
//                                   // color: Colors.white,
//                                   child: InkWell(
//                                     onTap: () async {
//                                       showDialogWidget(context, model[selectedIndex], index);
//                                       await runAddToCartAnimation(widgetKey);
//                                       await cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());
//                                     },
//                                     child: Stack(
//                                       children: [
//                                         Center(
//                                           child: UnconstrainedBox(
//                                             child: Container(
//                                               width: 250,
//                                               height: 310,
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(10),
//                                                 color: Colors.white,
//                                               ),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.all(20),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment.spaceBetween,
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: [
//                                                     const SizedBox(height: 120),
//                                                     FittedBox(
//                                                         child: Text(
//                                                           model[selectedIndex].foodVariants[index].name,
//                                                           style: const TextStyle(
//                                                               fontSize: 30,
//                                                               fontWeight: FontWeight.w900),
//                                                         )),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           '${model[selectedIndex].foodVariants[index].gram} гр',
//                                                           style: TextStyle(
//                                                             color:
//                                                             Colors.grey.withOpacity(0.6),
//                                                             fontSize: 15,
//                                                             fontWeight: FontWeight.bold,
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           '${model[selectedIndex].foodVariants[index].calorie} ККал',
//                                                           style: TextStyle(
//                                                             color:
//                                                             Colors.grey.withOpacity(0.6),
//                                                             fontSize: 15,
//                                                             fontWeight: FontWeight.bold,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     FittedBox(
//                                                         child: Text(
//                                                           '${model[selectedIndex].foodVariants[index].price} ₽',
//                                                           style: const TextStyle(
//                                                               fontSize: 30,
//                                                               fontWeight: FontWeight.w900),
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.topCenter,
//                                           child: Container(
//                                               key: widgetKey,
//                                               width: 200,
//                                               height: 150,
//                                               child: Image.asset(model[selectedIndex].foodVariants[index].image)),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.15,
//               color: Colors.black,
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     border: Border.all(
//                       color: Colors.white.withOpacity(0.3),
//                       width: 0.5,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: AddToCartIcon(
//                             key: cartKey,
//                             badgeOptions: const BadgeOptions(
//                               active: false,
//                               backgroundColor: Colors.red,
//                             ),
//                             icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 30,)),
//                       ),
//                       const Expanded(
//                         child: Center(
//                           child: Text(
//                             'ВАША КОРЗИНА ПУСТА',
//                             style: TextStyle(color: Colors.white, fontSize: 30),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showDialogWidget(BuildContext context, SecondCategoriesModel model, int index) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Center(
//           child: SizedBox(
//             width: 430,
//             height: 600,
//             // color: Colors.white,
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 90,
//                     right: 0,
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.close,
//                           size: 30,
//                           color: Colors.white,
//                         ))),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     width: 350,
//                     height: 480,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 350,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(
//                                   10,
//                                 )),
//                             color: Colors.grey[100],
//                           ),
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 50,
//                               ),
//                               Text(
//                                 model.foodVariants[index].name,
//                                 style: const TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.w900),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text('${model.foodVariants[index].gram} гр',
//                                         style: const TextStyle(
//                                             fontSize: 17, color: Colors.grey)),
//                                     Text('${model.foodVariants[index].calorie} ККал',
//                                         style: const TextStyle(
//                                             fontSize: 17, color: Colors.grey)),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: 350,
//                           height: 320,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(20),
//                                 child: Column(
//                                   children: [
//                                     itemShowDialogWidget('${model.foodVariants[index].addIngredients?[index].igdName}', 20, addAndRemoveWidget(), Colors.red),
//                                     const SizedBox(height: 10),
//                                     itemShowDialogWidget('Сыр', 15, addAndRemoveWidget(), Colors.yellow),
//                                     const SizedBox(height: 10),
//                                     itemShowDialogWidget('Халапеньо', 20, addAndRemoveWidget(), Colors.green),
//                                   ],
//                                 ),
//                               ),
//                               const Divider(),
//                               Padding(
//                                 padding: const EdgeInsets.all(20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     addAndRemoveWidget(),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         const Text('Итого'),
//                                         Text('${model.foodVariants[index].price} ₽', style:
//                                         const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const Divider(),
//                               ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.orange,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(2),
//                                       ),
//                                       minimumSize: const Size(250, 45)
//                                   ),
//                                   onPressed: () {},
//                                   child: const Text('УБРАТЬ ИЗ КОРЗИНЫ', style: TextStyle(color: Colors.white),))
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: SizedBox(
//                       width: 200, height: 150, child: Image.asset(model.foodVariants[index].image)),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget addAndRemoveWidget() {
//     return Row(
//       children: [
//         SizedBox(
//           width: 30,
//           height: 30,
//           child: FloatingActionButton(
//             mini: true,
//             shape: const CircleBorder(),
//             onPressed: () {},
//             child: const Icon(Icons.remove),
//           ),
//         ),
//         const SizedBox(width: 10),
//         const Text(
//           '1',
//           style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(width: 10),
//         SizedBox(
//           width: 30,
//           height: 30,
//           child: FloatingActionButton(
//             mini: true,
//             shape: const CircleBorder(),
//             onPressed: () {},
//             child: const Icon(Icons.add),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget itemShowDialogWidget(String title, int price, Widget addAndRemove, Color color) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             CircleAvatar(
//               radius: 15,
//               backgroundColor: color,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(title),
//           ],
//         ),
//         Row(
//           children: [
//             Text('$price ₽', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
//             const SizedBox(width: 20),
//             addAndRemove,
//           ],
//         ),
//       ],
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:kfc_desktop/models/second_categories_model.dart';
//
// class SecondCategoriesListView extends StatelessWidget {
//   const SecondCategoriesListView({super.key, required this.scrollController, required this.secondCategoriesModel, required this.selectedIndex, required this.onItemSelected});
//   final ScrollController scrollController;
//   final List<SecondCategoriesModel> secondCategoriesModel;
//   final int selectedIndex;
//   final Function(int) onItemSelected;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 220,
//         child: Scrollbar(
//           controller: scrollController,
//           child: ListView.builder(
//             controller: scrollController,
//             itemCount: secondCategoriesModel.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () {
//                   onItemSelected(index);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(5),
//                   child: UnconstrainedBox(
//                     child: Container(
//                       width: 170,
//                       height: 170,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: selectedIndex == index
//                             ? Colors.black
//                             : Colors.deepOrange[700],
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: FittedBox(
//                               child: Text(
//                                 secondCategoriesModel[index].text,
//                                 style: const TextStyle(
//                                     fontSize: 30,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           const Spacer(),
//                           SizedBox(
//                             width: 150,
//                             height: 90,
//                             child: Image.asset(
//                               secondCategoriesModel[index].image,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
