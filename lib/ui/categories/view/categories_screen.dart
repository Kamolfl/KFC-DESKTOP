import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:kfc_desktop/models/categories_model.dart';
import 'package:kfc_desktop/ui/categories/categories.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final deviceInfoPlugin = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('КАТЕГОРИИ',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ComboScreen(),
                  const SizedBox(height: 10),
                  CategoriesGridScreen(categories: categories),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
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
      ),
    );
  }
}
