class CartItemSP {
  int id;
  String name;
  double price;
  String image;
  int quantity;
  double totalAmount;

  CartItemSP(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      this.quantity = 1,
      this.totalAmount = 0.0});

  factory CartItemSP.fromJson(Map<String, dynamic> json) => CartItemSP(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        quantity: json["quantity"],
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "quantity": quantity,
        "totalAmount": totalAmount,
      };
}
