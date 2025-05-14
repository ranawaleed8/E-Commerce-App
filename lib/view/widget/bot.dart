import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // أضف هذه

class Bot extends StatefulWidget {
  final String text1;
  final Color colr;
  final double h;
  final double w;
  final double size;
  final Widget page;

  const Bot({
    super.key,
    required this.text1,
    required this.colr,
    required this.h,
    required this.w,
    required this.size,
    required this.page,
  });

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), // تم التعديل
          color: const Color(0xf7ffffff),
        ),
        height: widget.h.h, // تم التعديل
        width: widget.w.w, // تم التعديل
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.page),
            );
          },
          child: Text(
            widget.text1,
            style: TextStyle(
              color: widget.colr,
              fontSize: widget.size.sp, // تم التعديل
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
