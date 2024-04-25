import 'package:delivery_025/constants/imports.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksPage extends StatefulWidget {
  static String id = "/book";

  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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
              childAspectRatio: .85),
          itemCount: BookList.books.length,
          itemBuilder: (context, index) {
            var booksItem = BookList.books[index];
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
                              height: MediaQuery.of(context).size.height * 0.73,
                              child: Column(
                                children: [
                                  /// BACK BUTTON
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
                                      padding: const EdgeInsets.all(12),
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.mainColor,
                                                spreadRadius: .5,
                                                blurRadius: 20,
                                                blurStyle: BlurStyle.outer)
                                          ]),
                                      child: Image(
                                        image: AssetImage(
                                          booksItem.image,
                                        ),
                                        fit: BoxFit.cover,
                                      )),

                                  /// NAME
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    child: Column(
                                      children: [
                                        Text(booksItem.name,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: Assets.lexend,
                                                color: Colors.black87)),
                                        Text(booksItem.description),
                                      ],
                                    ),
                                  ),

                                  /// CALCULATION
                                  Consumer<SPList>(
                                    builder: (context, value, child) {
                                      final totalPrice =
                                          booksItem.price * value.qty;

                                      return firstTap
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 12),
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${totalPrice.toStringAsFixed(2)} \$",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Container(
                                                          color: Colors.white,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              ///
                                                              value.removeItem(
                                                                  booksItem.id,
                                                                  booksItem);
                                                              value
                                                                  .decrementQTY();
                                                              value.updateCart(
                                                                  value.items);

                                                              value
                                                                  .saveIntoSp();

                                                              ///
                                                            },
                                                            icon: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .mainColor,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Container(
                                                          color: Colors.white,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              ///
                                                              value.addItem(booksItem.id, CartItemSP(
                                                                    id: booksItem
                                                                        .id,
                                                                    name: booksItem
                                                                        .name,
                                                                    price: booksItem
                                                                        .price,
                                                                    image: booksItem
                                                                        .image,
                                                                    quantity: 1,
                                                                  ));
                                                              value.incrementQTY();
                                                              value.updateCart(value.items);
                                                              value.saveIntoSp();
                                                              ///
                                                            },
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .mainColor,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 24.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(AppColors
                                                                  .mainColor), // Cha
                                                    ),
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(booksItem
                                                              .onlineBook),
                                                          mode: LaunchMode
                                                              .inAppWebView);
                                                    },
                                                    child: Text(
                                                      "Read online",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              Assets.lexend),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors
                                                                  .mainColor),
                                                    ),
                                                    onPressed: () {
                                                      firstTap = !firstTap;
                                                      value.addItem(booksItem.id, CartItemSP(
                                                            id: booksItem.id,
                                                            name:
                                                                booksItem.name,
                                                            price:
                                                                booksItem.price,
                                                            image:
                                                                booksItem.image,
                                                            quantity: 1,
                                                          ));
                                                      value.updateCart(value.items);
                                                      value.saveIntoSp();
                                                    },
                                                    child: Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              Assets.lexend),
                                                    ),
                                                  ),
                                                ],
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
                  child: ProductItemWidget(
                    productItem: booksItem,
                    isBook: true,
                  )),
            );
          },
        ),
      ),
    );
  }
/* showDialog(
  context: context,
  builder: (context) {
  return AlertDialog(
  title: CustomText(title: booksItem.name),
  content: CustomText(title: booksItem.description));
  });*/
}
