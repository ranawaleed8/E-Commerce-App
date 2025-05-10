import 'package:flutter/material.dart';

class Contaner extends StatelessWidget {
  final double curv1;
  final double curv2;
  final double h;
  final double w;
  final String img;
  const Contaner({
    super.key,
    required this.curv1,
    required this.curv2,
    required this.h,
    required this.w,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(curv1),
          topLeft: Radius.circular(curv2),
          bottomLeft: Radius.circular(curv1),
          bottomRight: Radius.circular(curv2),
        ),
      ),
      height: h,
      width: w,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(curv1),
          topLeft: Radius.circular(curv2),
          bottomLeft: Radius.circular(curv1),
          bottomRight: Radius.circular(curv2),
        ),
        child: Image.asset(img, fit: BoxFit.cover),
      ),
    );
  }
}
