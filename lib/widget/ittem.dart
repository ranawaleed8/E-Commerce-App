import 'package:flutter/material.dart';
import 'package:reval/main.dart';
import 'package:reval/widget/contaner.dart';
import 'package:reval/widget/imgbot.dart';
import 'package:reval/widget/textico.dart';
import 'package:reval/widget/texxt.dart';

class Ittem extends StatelessWidget {
  final String img1;
  final String name1;
  final String price1;
  final String img2;
  final String name2;
  final String price2;
  final Widget page;

  const Ittem({
    super.key,
    required this.img1,
    required this.name1,
    required this.price1,
    required this.img2,
    required this.name2,
    required this.price2,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 35),
            Center(
              child: Column(
                children: [
                  Contaner(curv1: 50, curv2: 50, h: 170, w: 140, img: img1),
                  SizedBox(height: 5),
                  Textico(
                    text1: 'ADD',
                    colr: Colors.black,
                    h: 35,
                    w: 80,
                    size: 18,
                    ico: Icons.add,
                    page: MyApp(),
                    family: "Creepster",
                  ),
                  SizedBox(height: 5),
                  Texxt(text1: name1, family: "", colr: Colors.black, size: 20),
                  Texxt(
                    text1: price1,
                    family: "",
                    colr: Colors.black45,
                    size: 18,
                  ),
                ],
              ),
            ),
            SizedBox(width: 30),
            Center(
              child: Column(
                children: [
                  Imgbot(
                    curv1: 50,
                    curv2: 50,
                    h: 170,
                    w: 140,
                    img: img2,
                    page: page,
                  ),
                  SizedBox(height: 5),
                  Textico(
                    text1: 'ADD',
                    colr: Colors.black,
                    h: 35,
                    w: 80,
                    size: 18,
                    ico: Icons.add,
                    page: MyApp(),
                    family: "Creepster",
                  ),
                  SizedBox(height: 5),
                  Texxt(text1: name2, family: "", colr: Colors.black, size: 20),
                  Texxt(
                    text1: price2,
                    family: "",
                    colr: Colors.black45,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
