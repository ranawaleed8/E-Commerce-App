import 'package:flutter/material.dart';

class Icobot extends StatefulWidget {
  final double size;
  final Widget page;
  final IconData icon; // <-- إضافة متغير للأيقونة

  const Icobot({
    super.key,
    required this.size,
    required this.page,
    required this.icon, // <-- مطلوب
  });

  @override
  State<Icobot> createState() => _IcobotState();
}

class _IcobotState extends State<Icobot> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.icon, // <-- استخدام الأيقونة اللي جاية من البرّا
        color: Colors.black,
        size: widget.size,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.page),
        );
      },
    );
  }
}
