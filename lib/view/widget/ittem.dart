import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ضروري
import 'package:reval/main.dart';
import 'package:reval/view/widget/imgbot.dart';
import 'package:reval/view/widget/textico.dart';
import 'package:reval/view/widget/texxt.dart';

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
            SizedBox(width: 35.w),
            Center(
              child: Column(
                children: [
                  Imgbot(
                    curv1: 50.r,
                    curv2: 50.r,
                    h: 170.h,
                    w: 140.w,
                    img: img1,
                    page: page,
                  ),
                  SizedBox(height: 5.h),
                  Textico(
                    text1: 'ADD',
                    colr: Colors.black,
                    h: 35.h,
                    w: 80.w,
                    size: 18.sp,
                    ico: Icons.add,
                    page: MyApp(),
                    family: "Creepster",
                  ),
                  SizedBox(height: 5.h),
                  Texxt(
                    text1: name1,
                    family: "",
                    colr: Colors.black,
                    size: 20.sp,
                  ),
                  Texxt(
                    text1: price1,
                    family: "",
                    colr: Colors.black45,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
            SizedBox(width: 30.w),
            Center(
              child: Column(
                children: [
                  Imgbot(
                    curv1: 50.r,
                    curv2: 50.r,
                    h: 170.h,
                    w: 140.w,
                    img: img2,
                    page: page,
                  ),
                  SizedBox(height: 5.h),
                  Textico(
                    text1: 'ADD',
                    colr: Colors.black,
                    h: 35.h,
                    w: 80.w,
                    size: 18.sp,
                    ico: Icons.add,
                    page: MyApp(),
                    family: "Creepster",
                  ),
                  SizedBox(height: 5.h),
                  Texxt(
                    text1: name2,
                    family: "",
                    colr: Colors.black,
                    size: 20.sp,
                  ),
                  Texxt(
                    text1: price2,
                    family: "",
                    colr: Colors.black45,
                    size: 18.sp,
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
