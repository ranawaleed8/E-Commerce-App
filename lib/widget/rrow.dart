import 'package:flutter/material.dart';
import 'package:reval/categores/cat.dart';
import 'package:reval/home.dart';
import 'package:reval/widget/catigor.dart';

class Rrow extends StatelessWidget {
  const Rrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Catigor(
          name: 'Dresses',
          img: 'images/girl3.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100,
          w: 80,
          size: 13,
        ),
        SizedBox(width: 8),
        Catigor(
          name: 'Formal',
          img: 'images/girl3.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100,
          w: 80,
          size: 13,
        ),
        SizedBox(width: 8),
        Catigor(
          name: 'Jeans',
          img: 'images/girl3.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100,
          w: 80,
          size: 13,
        ),
        SizedBox(width: 8),
        Catigor(
          name: 'Tops',
          img: 'images/girl3.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100,
          w: 80,
          size: 13,
        ),
      ],
    );
  }
}
