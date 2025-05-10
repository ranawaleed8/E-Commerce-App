import 'package:flutter/material.dart';
import 'package:reval/cartview.dart';
import 'package:reval/models/cart.dart';
import 'package:reval/models/wishlist_model.dart';
import 'package:reval/widget/contaner.dart';
import 'package:reval/widget/texxt.dart';

class ProductDetailsPage extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String price;

  const ProductDetailsPage({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  String selectedSize = 'S';
  int quantity = 1;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    isFavorited = WishlistModel().isInWishlist(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    double parsedPrice =
        double.tryParse(widget.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;

    return Scaffold(
      backgroundColor: Color(0xFFEBE3DD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back),
                    ),
                    Spacer(),
                    Texxt(
                      text1: 'Details',
                      family: "Titan_One",
                      colr: Colors.black,
                      size: 25,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CartPage()),
                        );
                      },
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      icon: Icon(
                        isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isFavorited ? Colors.red : null,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorited = !isFavorited;
                          if (isFavorited) {
                            WishlistModel().addItem(
                              WishlistItem(
                                imageUrl: widget.imageAsset,
                                title: widget.title,
                                price: parsedPrice,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to wishlist')),
                            );
                          } else {
                            WishlistModel().removeItem(widget.title);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Removed from wishlist')),
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Contaner(
                  curv1: 100,
                  curv2: 40,
                  h: 250,
                  w: 250,
                  img: widget.imageAsset,
                ),
                SizedBox(height: 20),
                Texxt(
                  text1: widget.title,
                  family: "Titan_One",
                  colr: Color(0xe8cb5e48),
                  size: 28,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Texxt(
                    text1: 'Sizes',
                    family: "",
                    colr: Color(0xe8000000),
                    size: 22,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children:
                      sizes.map((size) {
                        return ChoiceChip(
                          label: Text(size),
                          selected: selectedSize == size,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          selectedColor: Color(0xe8cb5e48),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color:
                                selectedSize == size
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Texxt(
                      text1: 'Quantity',
                      family: "",
                      colr: Color(0xe8000000),
                      size: 22,
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xe8cb5e48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        CartModel().addItem(
                          CartItem(
                            image: widget.imageAsset,
                            name: widget.title,
                            size: selectedSize,
                            price: parsedPrice,
                            quantity: quantity,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added to cart (Size: $selectedSize, Quantity: $quantity)',
                            ),
                          ),
                        );
                      },
                      child: Texxt(
                        text1: "Add to Cart",
                        family: "",
                        colr: Color(0xf7ffffff),
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
