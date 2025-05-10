// lib/models/wishlist_model.dart
class WishlistItem {
  final String imageUrl;
  final String title;
  final double price;
  bool isInCart;

  WishlistItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    this.isInCart = false, // افتراضيًا، العنصر ليس في السلة
  });
}

class WishlistModel {
  static final WishlistModel _instance = WishlistModel._internal();
  factory WishlistModel() => _instance;
  WishlistModel._internal();

  final List<WishlistItem> _items = [];

  List<WishlistItem> get items => _items;

  void addItem(WishlistItem item) {
    if (!_items.any((e) => e.title == item.title)) {
      _items.add(item);
    }
  }

  void removeItem(String title) {
    _items.removeWhere((item) => item.title == title);
  }

  bool isInWishlist(String title) {
    return _items.any((item) => item.title == title);
  }
}
