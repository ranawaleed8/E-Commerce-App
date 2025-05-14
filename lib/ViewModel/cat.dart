import 'package:flutter/material.dart';
import 'package:reval/ViewModel/itemss.dart';
import 'package:reval/view/screens/home.dart';
import 'package:reval/view/widget/icobot.dart';
import 'package:reval/view/widget/imgbot.dart';
import 'package:reval/view/widget/textico.dart';
import 'package:reval/view/widget/texxt.dart';

class Product {
  final String imagePath;
  final Widget page;
  final String name;
  final double price;
  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.page,
  });
}

class ShoppingScreen extends StatelessWidget {
  final String categoryName;
  final List<Product> products;

  const ShoppingScreen({
    Key? key,
    required this.categoryName,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE3DD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBE3DD),
        actions: [
          Icobot(size: 30, page: Home(), icon: Icons.shopping_cart),
          SizedBox(width: 10),
        ],
        title: Text(
          categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6, // <== هذا هو الأهم
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Column(
            children: [
              Imgbot(
                curv1: 50,
                curv2: 50,
                h: 170,
                w: 140,
                img: product.imagePath,
                page: ProductDetailsPage(
                  imageAsset: product.imagePath,
                  title: product.name,
                  price: "${product.price.toStringAsFixed(0)}\$",
                ),
              ),
              SizedBox(height: 5),
              Textico(
                text1: 'ADD',
                colr: Colors.black,
                h: 35,
                w: 80,
                size: 18,
                ico: Icons.add,
                page: ProductDetailsPage(
                  imageAsset: product.imagePath,
                  title: product.name,
                  price: "${product.price.toStringAsFixed(0)}\$",
                ),
                family: "Creepster",
              ),
              SizedBox(height: 5),
              Texxt(
                text1: product.name,
                family: "",
                colr: Colors.black,
                size: 20,
              ),
              Texxt(
                text1: "${product.price.toStringAsFixed(0)}\$",
                family: "",
                colr: Colors.black45,
                size: 18,
              ),
            ],
          );
        },
      ),
    );
  }
}
