class Books {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String onlineBook;
  int qty;

  Books(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.onlineBook,
      this.qty = 1});
}
