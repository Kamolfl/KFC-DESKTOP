import 'package:flutter/material.dart';
import 'package:kfc_desktop/ui/categories/view/combo_second_screen.dart';
import 'package:kfc_desktop/ui/second_categories/second_categories.dart';

class ComboScreen extends StatelessWidget {
  const ComboScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SecondCategories()));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepOrange[700]),
          ),
          const Positioned(
              left: 30,
              top: 20,
              child: Text('КОМБО ОБЕДЫ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          Positioned(
              left: 30,
              bottom: 20,
              child: Text('от 99 ₽',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 30,
                      fontWeight: FontWeight.w500))),
          Positioned(
              right: 30,
              top: 20,
              child: Text('4 позиций',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w500))),
          const Positioned(
              right: 30,
              bottom: 20,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Text('NEW',
                      style: TextStyle(
                          color: Colors.white, fontSize: 10)))),
        ],
      ),
    );
  }
}
