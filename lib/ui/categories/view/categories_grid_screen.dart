import 'package:flutter/material.dart';
import 'package:kfc_desktop/models/categories_model.dart';
import 'package:kfc_desktop/ui/categories/view/view.dart';
import 'package:kfc_desktop/ui/second_categories/second_categories.dart';

class CategoriesGridScreen extends StatelessWidget {
  const CategoriesGridScreen({super.key, required this.categories});
  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SecondCategories()));
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 20,
                  child: Text(
                    categories[index].title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  left: 30,
                  bottom: 20,
                  child: Text(
                    categories[index].price != null
                        ? 'ОТ ${categories[index].price} ₽' : '',
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 20,
                  child: Text('${categories[index].position} позиции',
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 15),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 200,
                    height: 150,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
