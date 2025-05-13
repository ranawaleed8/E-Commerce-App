import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:reval/account.dart';
import 'package:reval/cartview.dart';
import 'package:reval/viewall.dart';
import 'package:reval/widget/bot.dart';
import 'package:reval/widget/contaner.dart';
import 'package:reval/widget/icobot.dart';
import 'package:reval/widget/ittem.dart';
import 'package:reval/widget/rrow.dart';
import 'package:reval/widget/texxt.dart';
import 'package:reval/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = [
    Icon(Icons.account_circle, size: 30, color: Color(0xFF000000)),
    Icon(Icons.home, size: 30, color: Color(0xe8cb5e48)),
    Icon(Icons.favorite, size: 30, color: Color(0xFF000000)),
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
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Texxt(
            text1: 'Reval',
            family: "Titan_One",
            colr: Colors.black,
            size: 35,
          ),
        ),
        actions: [
          Icobot(size: 30, page: CartPage(), icon: Icons.shopping_cart),
          SizedBox(width: 10),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Color(0xFFEBE3DD),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        items: items,
        onTap: (index) => _navigateToPage(index),
      ),
      backgroundColor: Color(0xFFEBE3DD),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Contaner(
                    curv1: 80,
                    curv2: 8,
                    h: 280,
                    w: 230,
                    img: 'images/girl4.jpg',
                  ),
                  SizedBox(width: 10),
                  Contaner(
                    curv1: 80,
                    curv2: 8,
                    h: 280,
                    w: 230,
                    img: 'images/girl4.jpg',
                  ),
                  SizedBox(width: 10),
                  Contaner(
                    curv1: 80,
                    curv2: 8,
                    h: 280,
                    w: 230,
                    img: 'images/girl2.jpg',
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 15),
                Texxt(
                  text1: 'CATEGORIES',
                  family: "Titan_One",
                  colr: Color(0xe8cb5e48),
                  size: 22,
                ),
                SizedBox(width: 135),
                Bot(
                  text1: 'View all',
                  colr: Colors.black45,
                  h: 30,
                  w: 75,
                  size: 13,
                  page: Viewall(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Rrow(),
            SizedBox(height: 40),
            Row(
              children: [
                SizedBox(width: 15),
                Texxt(
                  text1: 'NEW ITEMS',
                  family: "Titan_One",
                  colr: Color(0xe8cb5e48),
                  size: 22,
                ),
              ],
            ),
            SizedBox(height: 20),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20),
            Ittem(
              img1: 'images/girl2.jpg',
              name1: 'Short dress',
              price1: '70\$',
              img2: 'images/girl2.jpg',
              name2: 'Short dress',
              price2: '100\$',
              page: Home(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
