import 'package:flutter/material.dart';
import 'package:kfc_desktop/models/second_categories_model.dart';

class SecondCategoriesListView extends StatelessWidget {
  const SecondCategoriesListView({super.key, required this.scrollController, required this.secondCategoriesModel, required this.selectedIndex, required this.onItemSelected});
  final ScrollController scrollController;
  final List<SecondCategoriesModel> secondCategoriesModel;
  final int selectedIndex;
  final Function(int) onItemSelected;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 220,
        child: Scrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: secondCategoriesModel.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  onItemSelected(index);
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
                                secondCategoriesModel[index].text,
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
                              secondCategoriesModel[index].image,
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
    );
  }
}
