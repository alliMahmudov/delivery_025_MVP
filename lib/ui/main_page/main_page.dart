import 'package:delivery_025/constants/imports.dart';

class MainPage extends StatefulWidget {

  static String id = "/main";
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tabs = [
    Tab(
        child: Text("Food",
            style: TextStyle(
                fontFamily: Assets.lexend, color: Colors.white, fontSize: 16))),
    Tab(
        child: Text("Book",
            style: TextStyle(
                fontFamily: Assets.lexend, color: Colors.white, fontSize: 16))),
    Tab(
        child: Text("Clothes",
            style: TextStyle(
                fontFamily: Assets.lexend, color: Colors.white, fontSize: 16))),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Want to contact?',
                      style:
                      TextStyle(fontFamily: Assets.lexend, fontSize: 20),
                    ),
                    content: Text(
                      'Call to +998 93 000 03 91.',
                      style: TextStyle(
                          fontFamily: Assets.lexend,
                          fontSize: 16,
                          color: Colors.grey.shade700),
                    ),
                    actions: [
                      Consumer<SPList>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text("Ok"),
                          );
                        },
                      )
                    ],
                  );},
              );
            },
            icon: Icon(Icons.support_agent, color: Colors.white,)),
        title: Text(
          "025 Delivery",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: Assets.lexend),
        ),
        backgroundColor: AppColors.mainColor,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                  color:AppColors.mainColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(12)),
              child: TabBar(
                  padding: const EdgeInsets.all(4),
                  controller: _tabController,
                  splashBorderRadius: BorderRadius.circular(12),
                  // indicatorColor: AppColors.red,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 0.1,
                  indicator: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  tabs: tabs),
            ),
          ),
          Expanded(
              child: TabBarView(
                  dragStartBehavior: DragStartBehavior.down,
                  controller: _tabController,
                  children: [
                const FoodPage(),
                const BooksPage(),
                const ClothesPage()
              ]))
        ],
      ),
    );
  }
}
