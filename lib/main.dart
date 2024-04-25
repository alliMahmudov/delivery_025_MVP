
import 'package:delivery_025/ui/payment_page/payment_page.dart';

import 'constants/imports.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SPList(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        inputDecorationTheme: InputDecorationTheme(
          counterStyle: TextStyle(color: Colors.transparent),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
      routes: {
        MainPage.id: (context) => const MainPage(),
        FoodPage.id: (context) => const FoodPage(),
        BooksPage.id: (context) => const BooksPage(),
        ClothesPage.id: (context) => const ClothesPage(),
        CartPage.id: (context) => const ClothesPage(),
        //MapPage.id: (context) => const MapPage(),
        PaymentPage.id: (context) => const PaymentPage(),
      },
    );
  }
}
