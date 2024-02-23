import 'package:flutter/material.dart';
import 'package:kfc_desktop/models/second_categories_model.dart';

class SecondCategoriesGridview extends StatelessWidget {
  const SecondCategoriesGridview({super.key, required this.secondCategoriesModel, required this.selectedIndex});

  final List<SecondCategoriesModel> secondCategoriesModel;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(secondCategoriesModel[selectedIndex].text,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: secondCategoriesModel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialogWidget(context, secondCategoriesModel[index], index);
                    },
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 120),
                                    FittedBox(
                                        child: Text(
                                          secondCategoriesModel[selectedIndex].text,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${secondCategoriesModel[index].foodVariants[index].gram} гр',
                                          style: TextStyle(
                                            color:
                                            Colors.grey.withOpacity(0.6),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${secondCategoriesModel[index].foodVariants[index].calorie} ККал',
                                          style: TextStyle(
                                            color:
                                            Colors.grey.withOpacity(0.6),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FittedBox(
                                        child: Text(
                                          '${secondCategoriesModel[index].foodVariants[index].price} ₽',
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
                              child: Image.asset(secondCategoriesModel[selectedIndex].image)),
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
    );
  }

  void showDialogWidget(BuildContext context, SecondCategoriesModel model, int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: SizedBox(
            width: 430,
            height: 600,
            // color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                    top: 90,
                    right: 0,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.white,
                        ))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 350,
                    height: 480,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 350,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(
                                  10,
                                )),
                            color: Colors.grey[100],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                model.text,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w900),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${model.foodVariants[index].gram} гр',
                                        style: const TextStyle(
                                            fontSize: 17, color: Colors.grey)),
                                    Text('${model.foodVariants[index].calorie} ККал',
                                        style: const TextStyle(
                                            fontSize: 17, color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 320,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    itemShowDialogWidget('Бекон', '20',
                                        const Icon(Icons.add), Colors.red),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    itemShowDialogWidget(' Сыр', '15',
                                        const Icon(Icons.add), Colors.yellow),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    itemShowDialogWidget('Халапеньо', '20',
                                        const Icon(Icons.add), Colors.green),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: FloatingActionButton(
                                            mini: true,
                                            shape: const CircleBorder(),
                                            onPressed: () {},
                                            child: const Icon(Icons.remove),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          '1',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: FloatingActionButton(
                                            mini: true,
                                            shape: const CircleBorder(),
                                            onPressed: () {},
                                            child: const Icon(Icons.add),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Итого'),
                                        Text('${model.foodVariants[index].price} ₽', style:
                                        const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      minimumSize: const Size(250, 55)
                                  ),
                                  onPressed: () {},
                                  child: const Text('УБРАТЬ ИЗ КОРЗИНЫ', style: TextStyle(color: Colors.white),))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      width: 200, height: 150, child: Image.asset(model.image)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget itemShowDialogWidget(String title, String price, Icon icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title),
          ],
        ),
        Row(
          children: [
            Text('$price ₽', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(width: 10),
            SizedBox(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                mini: true,
                shape: const CircleBorder(),
                onPressed: () {},
                child: icon,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
