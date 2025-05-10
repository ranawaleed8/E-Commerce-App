class CartItem {
  final String image;
  final String name;
  final String size;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.size,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  Map<String, dynamic> toJson() => {
    'name': name,
    'size': size,
    'price': price,
    'quantity': quantity,
  };
}

class CartModel {
  static final CartModel _instance = CartModel._internal();
  factory CartModel() => _instance;
  CartModel._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
  }

  void removeItem(int index) {
    _items.removeAt(index);
  }

  void clear() {
    _items.clear();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);
}
