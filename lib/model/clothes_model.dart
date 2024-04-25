

class Clothes {
  final int id;
  final String name;
  final String image;
  final double price;
  int qty;

  Clothes({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.qty = 1
  });

}