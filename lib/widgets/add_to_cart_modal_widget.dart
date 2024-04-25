/*
import 'package:delivery_025/constants/imports.dart';

class AddToCartModalWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const AddToCartModalWidget({required this.image, required this.name, required this.price,  super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CartPro>();

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  provider.clearQTY();
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
                margin: EdgeInsets.all(12),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.mainColor,
                          spreadRadius: .1,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                color: AppColors.secondColor,
                child: Text(name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.lexend,
                        color: Colors.black87
                    )),
              ),
            ),
            Expanded(child: Consumer<CartPro>(
              builder: (context, cartProvider, child) {
                final itemPrice = double.parse(price
                    .replaceAll(RegExp(r'[^\d.]'), ''));
                final totalPrice = itemPrice * cartProvider.qty;

                return firstTap
                    ? Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius:
                      BorderRadius.circular(12)),
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${totalPrice.toStringAsFixed(2)} \$",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(12),
                            child: Container(
                              color: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  cartProvider
                                      .removeFromCart(
                                      foodItem);
                                  cartProvider
                                      .decrement();
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color:
                                  AppColors.mainColor,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${cartProvider.qty}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(12),
                            child: Container(
                              color: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  cartProvider.addToCart(
                                      foodItem);
                                  cartProvider
                                      .increment();
                                },
                                icon: Icon(
                                  Icons.add,
                                  color:
                                  AppColors.mainColor,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainColor), // Cha
                    ),
                    onPressed: () {
                      firstTap = !firstTap;
                      cartProvider.addToCart(foodItem);
                    },
                    child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontFamily: Assets.lexend),),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
*/
