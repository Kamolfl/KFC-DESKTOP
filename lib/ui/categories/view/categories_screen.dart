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
      body: Column(
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
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 30,),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'ВАША КОРЗИНА ПУСТА',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
