import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfc_desktop/models/food_variant.dart';
import 'package:kfc_desktop/models/second_categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/counter_bloc/counter_bloc.dart';

class IngredientRow extends StatefulWidget {
  IngredientRow({super.key, this.color, this.ingrdient});

  Color? color;
  Ingredient? ingrdient;

  @override
  State<IngredientRow> createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: widget.color,
            ),
            const SizedBox(
              width: 10,
            ),
            Text('${widget.ingrdient?.name}'),
          ],
        ),
        Row(
          children: [
            Text('${widget.ingrdient?.price} ₽',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(width: 20),
            addAndRemoveWidget(),
          ],
        ),
      ],
    );
  }


  Widget addAndRemoveWidget() {
    return BlocBuilder<ShopBloc, CounterState>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                mini: true,
                shape: const CircleBorder(),
                onPressed: () {
                  BlocProvider.of<ShopBloc>(context).add(CounterDecrementEvent());
                },
                child: const Icon(Icons.remove),
              ),
            ),
            const SizedBox(width: 10),
            BlocBuilder<ShopBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterNumberState){
                  return Text('${state.count}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500));
                }
                return const Text('1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                );
              },
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                mini: true,
                shape: const CircleBorder(),
                onPressed: () {
                  BlocProvider.of<ShopBloc>(context).add(FoodVariantAddedEvent());
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }

}

