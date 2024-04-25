import 'package:delivery_025/constants/imports.dart';

class ClothesPage extends StatefulWidget {
  static String id = "/clothing";
  const ClothesPage({super.key});

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {

  bool firstTap = false;
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<SPList>();
    return SafeArea(
      child: RawScrollbar(
        thumbVisibility: true,
        thumbColor: AppColors.mainColor,
        thickness: 8,
        radius: const Radius.circular(4),
        controller: scrollController,
        child: GridView.builder(
          controller: scrollController,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 30),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 8.0, // Spacing between columns
              mainAxisSpacing: 8.0, // Spacing between rows
              childAspectRatio: 1.0),
          itemCount: ClothesList.clothes.length,
          itemBuilder: (context, index) {
            var clothesItem = ClothesList.clothes[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Column(
                              children: [
                                /// CLOSE BUTTON
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

                                /// IMAGE
                                Container(
                                    margin: const EdgeInsets.all(12),
                                    height: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.mainColor,
                                              spreadRadius: .5,
                                              blurRadius: 20,
                                              blurStyle: BlurStyle.outer)
                                        ]),
                                    child: Image(
                                      image: AssetImage(
                                        clothesItem.image,
                                      ),
                                      fit: BoxFit.cover,
                                    )),

                                /// NAME
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    color: AppColors.secondColor,
                                    child: Text(clothesItem.name,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Assets.lexend,
                                            color: Colors.black87
                                        )),
                                  ),
                                ),

                                /// CALCULATION
                                Consumer<SPList>(
                                  builder: (context, value, child) {
                                    final totalPrice = clothesItem.price * value.qty;

                                    return firstTap
                                        ? Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.mainColor,
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                      padding: const EdgeInsets.all(8),
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
                                                      ///
                                                      value.removeItem(clothesItem.id,clothesItem);
                                                      value.decrementQTY();
                                                      value.saveIntoSp();
                                                      value.updateCart(value.items);

                                                      ///
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
                                                "${value.qty}",
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
                                                      ///
                                                      value.addItem(clothesItem.id, CartItemSP(
                                                        id: clothesItem.id,
                                                        name: clothesItem.name,
                                                        price: clothesItem.price,
                                                        image: clothesItem.image,
                                                        quantity: 1,
                                                      ));
                                                      value.incrementQTY();
                                                      value.saveIntoSp();
                                                      value.updateCart(value.items);


                                                      ///
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
                                          value.addItem(clothesItem.id, CartItemSP(
                                            id: clothesItem.id,
                                            name: clothesItem.name,
                                            price: clothesItem.price,
                                            image: clothesItem.image,
                                            quantity: 1,
                                          ));
                                          value.updateCart(value.items);
                                        },
                                        child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontFamily: Assets.lexend),),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: ProductItemWidget(productItem: clothesItem)
              ),
            );
          },
        ),
      ),
    );
  }
}
