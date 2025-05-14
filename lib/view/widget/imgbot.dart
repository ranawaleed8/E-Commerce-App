import 'package:flutter/material.dart';

class Imgbot extends StatefulWidget {
  final double curv1;
  final double curv2;
  final double h;
  final double w;
  final String img;
  final Widget page;
  const Imgbot({
    super.key,
    required this.curv1,
    required this.curv2,
    required this.h,
    required this.w,
    required this.img,
    required this.page,
  });

  @override
  State<Imgbot> createState() => _ImgbotState();
}

class _ImgbotState extends State<Imgbot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(widget.curv1),
          topLeft: Radius.circular(widget.curv2),
          bottomLeft: Radius.circular(widget.curv1),
          bottomRight: Radius.circular(widget.curv2),
        ),
      ),
      height: widget.h,
      width: widget.w,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
          );
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ), // يشيل المسافات حول الصورة
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(widget.curv1),
            topLeft: Radius.circular(widget.curv2),
            bottomLeft: Radius.circular(widget.curv1),
            bottomRight: Radius.circular(widget.curv2),
          ),
          child: Image.asset(widget.img, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
