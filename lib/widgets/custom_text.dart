import 'package:delivery_025/constants/assets.dart';
import 'package:delivery_025/constants/imports.dart';

class CustomText extends StatelessWidget {
  final String title;
  const CustomText({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontFamily: Assets.lexend),);
  }
}
