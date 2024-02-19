import 'package:flutter/material.dart';
import 'package:kfc_desktop/models/categories_model.dart';

class CategoriesGridSecondScreen extends StatelessWidget {
  const CategoriesGridSecondScreen({super.key, required this.categories});
  final CategoriesModel categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categories.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        ],
      ),
    );
  }
}
