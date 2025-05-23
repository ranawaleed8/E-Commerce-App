import 'package:flutter/material.dart';
import 'package:reval/view/screens/checkout.dart';
import 'package:reval/models/cart.dart';
import 'package:reval/view/widget/contaner.dart';
import 'package:reval/view/widget/texxt.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel().items;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(fontFamily: "Titan_One"),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xe8ffffff),
      ),
      backgroundColor: Color(0xFFEBE3DD),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            cartItems.isEmpty
                ? Center(child: Text('Your cart is empty.'))
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: Contaner(
                                curv1: 40,
                                curv2: 40,
                                h: 70,
                                w: 50,
                                img: item.image,
                              ),
                              title: Text(item.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Size: ${item.size}'),
                                  Text(
                                    'Price: \$${item.price.toStringAsFixed(2)}',
                                  ),
                                  Text('Qty: ${item.quantity}'),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Color(0xe8cb5e48),
                                ),
                                onPressed: () {
                                  setState(() {
                                    CartModel().removeItem(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: \$${CartModel().totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Sending to backend:");
                            print(
                              CartModel().items.map((e) => e.toJson()).toList(),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Purchase(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xe8cb5e48),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                          ),
                          child: Texxt(
                            text1: "Checkout",
                            family: "",
                            colr: Color(0xf7ffffff),
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
