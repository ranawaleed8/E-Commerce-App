import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ضروري
import 'package:reval/ViewModel/cat.dart';
import 'package:reval/view/screens/home.dart';
import 'package:reval/view/widget/catigor.dart';

class Rrow extends StatelessWidget {
  const Rrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        Catigor(
          name: 'Dresses',
          img: 'images/girl3.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100.h,
          w: 80.w,
          size: 13.sp,
        ),
        SizedBox(width: 8.w),
        Catigor(
          name: 'Formal',
          img: 'images/image1.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100.h,
          w: 80.w,
          size: 13.sp,
        ),
        SizedBox(width: 8.w),
        Catigor(
          name: 'Jeans',
          img: 'images/jeans.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100.h,
          w: 80.w,
          size: 13.sp,
        ),
        SizedBox(width: 8.w),
        Catigor(
          name: 'Tops',
          img: 'images/top.jpg',
          page: ShoppingScreen(
            categoryName: 'Dresses',
            products: [
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 70,
                page: Home(),
              ),
              Product(
                imagePath: 'images/girl1.jpg',
                name: 'Short dress',
                price: 100,
                page: Home(),
              ),
            ],
          ),
          h: 100.h,
          w: 80.w,
          size: 13.sp,
        ),
      ],
    );
  }
}
