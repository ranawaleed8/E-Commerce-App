import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:reval/view/screens/account.dart';
import 'package:reval/models/wishlist_model.dart';
import 'package:reval/view/screens/cartview.dart';
import 'package:reval/ViewModel/itemss.dart';
import 'package:reval/view/screens/home.dart';
import 'package:reval/view/widget/imgbot.dart';
import 'package:reval/view/widget/texxt.dart';

class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final items = [
    Icon(Icons.account_circle, size: 30, color: Color(0xe8000000)),
    Icon(Icons.home, size: 30, color: Color(0xe8000000)),
    Icon(Icons.favorite, size: 30, color: Color(0xe8cb5e48)),
  ];

  int index = 2;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<WishlistItem> wishlistItems = WishlistModel().items;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Texxt(
            text1: "Wishlist",
            family: "Titan_One",
            colr: Colors.black,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFEBE3DD),
      body:
          wishlistItems.isEmpty
              ? Center(
                child: Text(
                  'No items in your wishlist',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return ListTile(
                    leading: Imgbot(
                      curv1: 50,
                      curv2: 50,
                      h: 100,
                      w: 50,
                      img: item.imageUrl,
                      page: ProductDetailsPage(
                        imageAsset: item.imageUrl,
                        title: item.title,
                        price: "\$${item.price.toStringAsFixed(2)}",
                      ),
                    ),
                    title: Texxt(
                      text1: item.title,
                      family: "",
                      colr: Colors.black,
                      size: 20,
                    ),
                    subtitle: Texxt(
                      text1: "\$${item.price.toStringAsFixed(2)}",
                      family: "",
                      colr: Colors.black45,
                      size: 18,
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          0xe8cb5e48,
                        ), // لون ثابت لأن المنتج موجود في الـ Wishlist بالفعل
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailsPage(
                                  imageAsset: item.imageUrl,
                                  title: item.title,
                                  price: "\$${item.price.toStringAsFixed(2)}",
                                ),
                          ),
                        );
                      },
                      child: Texxt(
                        text1: "View Details",
                        family: "",
                        colr: Colors.white,
                        size: 13,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  );
                },
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
    );
  }
}
