import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:reval/cartview.dart';
import 'package:reval/home.dart';
import 'package:reval/log_in.dart';
import 'package:reval/wishlist.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final items = [
    Icon(Icons.account_circle, size: 30, color: Color(0xe8cb5e48)),
    Icon(Icons.home, size: 30, color: Color(0xe8000000)),
    Icon(Icons.favorite, size: 30, color: Color(0xe8000000)),
  ];

  int index = 0;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
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
        title: const Text(
          'My Account',
          style: TextStyle(fontFamily: "Titan_One"),
        ),
        centerTitle: true,
        backgroundColor: Color(0xe8cb5e48),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔒 Account Info Section with Icon
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Color(0xe8cb5e48),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello, John',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'john@example.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 📦 Menu Items
          _buildListTile(Icons.shopping_bag, 'My Orders', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }),
          _buildListTile(Icons.favorite, 'Favorites', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Wishlist()),
            );
          }),
          _buildListTile(Icons.logout, 'Log Out', () {
            // Confirm Logout Dialog
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xe8cb5e48)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => logIn()),
                          );
                        },
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Color(0xe8cb5e48)),
                        ),
                      ),
                    ],
                  ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xe8cb5e48)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
