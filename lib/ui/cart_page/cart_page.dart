import 'package:delivery_025/constants/imports.dart';

import 'package:delivery_025/ui/payment_page/payment_page.dart';


class CartPage extends StatefulWidget {
  static String id = "/cart";
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    final SP = context.read<SPList>();
    SP.readFromSp();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     SP.loadTotalAmount();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<SPList>(
        builder: (BuildContext context, SPList value, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 32,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.mainColor,
          title: Text(
            'Cart',
            style: TextStyle(fontFamily: Assets.lexend, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                value.clearCart();
                value.saveIntoSp();
                value.updateCart(value.items);
              },
              icon: const Icon(
                size: 24,
                Icons.delete_outline,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SafeArea(
            child: value.items.isEmpty
                ? Center(
                    child: Text("Cart is empty",
                        style:
                            TextStyle(fontFamily: Assets.lexend, fontSize: 20)),
                  )
                : value.items.isNotEmpty
                    ? RawScrollbar(
                        thumbVisibility: true,
                        thumbColor: AppColors.mainColor,
                        thickness: 8,
                        radius: const Radius.circular(4),
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: value.items.length,
                            itemBuilder: (context, index) {
                              final cartItem = value.items[index];

                              final total = cartItem.price * cartItem.quantity;
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.secondColor,
                                ),
                                margin: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  style: ListTileStyle.list,
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Image(
                                          image: AssetImage(cartItem.image),
                                          fit: BoxFit.contain,
                                        )),
                                  ),
                                  title: CustomText(title: cartItem.name),
                                  subtitle: Row(
                                    children: [
                                      CustomText(
                                          title: "\$${total.toStringAsFixed(2)}"),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        width: 70,
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  //value.removeFromCart(cartItem);
                                                  value.removeItem(
                                                      cartItem.id, cartItem);
                                                  value.updateCart(value.items);
                                                  value.saveIntoSp();
                                                },
                                                child: const Icon(Icons.remove)),
                                            Text(
                                              "${cartItem.quantity}",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  // value.addToCart(cartItem);
                                                  value.addItem(
                                                      cartItem.id, cartItem);
                                                  value.updateCart(value.items);
                                                  value.saveIntoSp();
                                                },
                                                child: const Icon(Icons.add)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        ///
                                        value.deleteItem(cartItem);
                                        value.saveIntoSp();
                                        value.updateCart(value.items);

                                        ///
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "Something went wrong",
                          style: TextStyle(fontFamily: Assets.lexend),
                        ),
                      )),
        bottomNavigationBar: value.items.isEmpty ? const SizedBox.shrink() :Container(
          decoration: BoxDecoration(
            color: AppColors.secondColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36),),
        ),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Free delivery",
                style: TextStyle(fontSize: 18, fontFamily: Assets.lexend),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage(totalPrice: value.totalAmount.toStringAsFixed(2),)),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount:",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Assets.lexend,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${value.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Assets.lexend,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      );
    });
  }
}
