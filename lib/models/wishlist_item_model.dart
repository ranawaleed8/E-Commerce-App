class WishlistItem {
  final String imageUrl;
  final String title;
  final double price;
  final bool isInCart;

  WishlistItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    this.isInCart = false,
  });
}
