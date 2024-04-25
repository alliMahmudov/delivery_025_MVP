

import 'package:delivery_025/constants/imports.dart';

class ProductItemWidget extends StatelessWidget {
  final dynamic productItem;
  final bool isBook;
  const ProductItemWidget({required this.productItem,this.isBook = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor.withOpacity(.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            height: isBook ? 110 : 80,
            width: 100,
            child: Image.asset(
              productItem.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productItem.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: isBook ? 16 : 15,
                fontWeight: FontWeight.w600,
                fontFamily: Assets.lexend),
          ),
          Text(
            "\$${productItem.price}",
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
