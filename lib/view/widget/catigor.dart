import 'package:flutter/material.dart';
import 'package:reval/view/widget/imgbot.dart';
import 'package:reval/view/widget/texxt.dart';

class Catigor extends StatelessWidget {
  final Widget page;
  final String img;
  final String name;
  final double h;
  final double w;
  final double size;
  const Catigor({
    super.key,
    required this.name,
    required this.img,
    required this.page,
    required this.w,
    required this.h,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Imgbot(curv1: 40, curv2: 40, h: h, w: w, img: img, page: page),
        Texxt(text1: name, family: "", colr: Color(0xff817162), size: size),
      ],
    );
  }
}
