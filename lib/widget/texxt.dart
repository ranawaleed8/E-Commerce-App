import 'package:flutter/material.dart';

class Texxt extends StatelessWidget {
  final String text1;
  final String family;
  final Color colr;
  final double size;
  const Texxt({
    super.key,
    required this.text1,
    required this.family,
    required this.colr,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: colr,
        fontSize: size,
        fontWeight: FontWeight.w900,
        fontFamily: family,
      ),
    );
  }
}
