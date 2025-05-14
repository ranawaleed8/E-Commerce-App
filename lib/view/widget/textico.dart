import 'package:flutter/material.dart';

class Textico extends StatefulWidget {
  final String text1;
  final Color colr;
  final double h;
  final double w;
  final double size;
  final IconData ico;
  final Widget page;
  final String family;

  const Textico({
    super.key,
    required this.text1,
    required this.colr,
    required this.h,
    required this.w,
    required this.size,
    required this.ico,
    required this.page,
    required this.family,
  });

  @override
  State<Textico> createState() => _TexticoState();
}

class _TexticoState extends State<Textico> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xf7ffffff),
        ),
        height: widget.h,
        width: widget.w,
        child: TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.page),
            );
          },
          icon: Icon(widget.ico, color: widget.colr, size: widget.size),
          label: Text(
            widget.text1,
            style: TextStyle(
              color: widget.colr,
              fontSize: widget.size,
              fontWeight: FontWeight.bold,
              fontFamily: widget.family,
            ),
          ),
        ),
      ),
    );
  }
}
