import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reval/view/screens/account.dart';
import 'package:reval/view/screens/cartview.dart';
import 'package:reval/view/screens/viewall.dart';
import 'package:reval/view/widget/bot.dart';
import 'package:reval/view/widget/contaner.dart';
import 'package:reval/view/widget/icobot.dart';
import 'package:reval/view/widget/ittem.dart';
import 'package:reval/view/widget/rrow.dart';
import 'package:reval/view/widget/texxt.dart';
import 'package:reval/view/screens/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = [
    Icon(Icons.account_circle, size: 30.sp, color: Color(0xFF000000)),
    Icon(Icons.home, size: 30.sp, color: Color(0xe8cb5e48)),
    Icon(Icons.favorite, size: 30.sp, color: Color(0xFF000000)),
  ];
  int index = 1;
  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wishlist()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBE3DD),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: Texxt(
            text1: 'Reval',
            family: "Titan_One",
            colr: Colors.black,
            size: 35.sp,
          ),
        ),
        actions: [
          Icobot(size: 30.sp, page: CartPage(), icon: Icons.shopping_cart),
          SizedBox(width: 10.w),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Color(0xFFEBE3DD),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 60.h,
        animationDuration: Duration(milliseconds: 300),
        items: items,
        onTap: (index) => _navigateToPage(index),
      ),
      backgroundColor: Color(0xFFEBE3DD),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15.w),
                  Contaner(
                    curv1: 80.r,
                    curv2: 8.r,
                    h: 280.h,
                    w: 230.w,
                    img: 'images/girl4.jpg',
                  ),
                  SizedBox(width: 10.w),
                  Contaner(
                    curv1: 80.r,
                    curv2: 8.r,
                    h: 280.h,
                    w: 230.w,
                    img: 'images/girl2.jpg',
                  ),
                  SizedBox(width: 10.w),
                  Contaner(
                    curv1: 80.r,
                    curv2: 8.r,
                    h: 280.h,
                    w: 230.w,
                    img: 'images/girl1.jpg',
                  ),
                  SizedBox(width: 15.w),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                Texxt(
                  text1: 'CATEGORIES',
                  family: "Titan_One",
                  colr: Color(0xe8cb5e48),
                  size: 22.sp,
                ),
                SizedBox(width: 97.w),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // أو .r لو تبيها دائرية
                  child: Bot(
                    text1: 'View all',
                    colr: Colors.black45,
                    h: 30,
                    w: 75,
                    size: 13,
                    page: Viewall(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Rrow(),
            SizedBox(height: 40.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                Texxt(
                  text1: 'NEW ITEMS',
                  family: "Titan_One",
                  colr: Color(0xe8cb5e48),
                  size: 22.sp,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Ittem(
              img1: 'images/girl4.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/jean.jpg',
              name2: 'Jeans',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20.h),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20.h),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20.h),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
