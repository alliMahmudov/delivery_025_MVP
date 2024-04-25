import 'package:delivery_025/constants/imports.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';


class PaymentPage extends StatefulWidget {
  static String id = "/payment";
  final String totalPrice;

  const PaymentPage({this.totalPrice = '0.0', super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    _CardController.addListener(_formatCardNumber);
  }


  bool isCash = true;
  final TextEditingController _CardController = TextEditingController();
  final TextEditingController _ExpirateController = TextEditingController();
  String _previousText = '';
  String cardNumber = '';
  bool hasCard = false;
  void _formatCardNumber() {
    String text = _CardController.text;
    if (text.length > _previousText.length) {
      if (text.length == 4 || text.length == 9 || text.length == 14) {
        _CardController.text = text + ' ';
        _CardController.selection = TextSelection.fromPosition(
            TextPosition(offset: _CardController.text.length));
      }
    }
    _previousText = _CardController.text;
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   // final provider = context.read<SPList>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
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
        title: Text(
          "Placing an order",
          style: TextStyle(color: Colors.white, fontFamily: Assets.lexend),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ADDRESS
              Text(
                "Delivery address",
                style: TextStyle(fontSize: 22, fontFamily: Assets.lexend),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontFamily: Assets.lexend),
                //controller: _CardController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill out this field';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              /// PHONE NUMBER
              Text(
                "Phone number",
                style: TextStyle(fontSize: 22, fontFamily: Assets.lexend),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontFamily: Assets.lexend),
                //controller: _CardController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill out this field';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                maxLength: 19,
                inputFormatters: [
                  MaskedInputFormatter('(##) ###-##-##'),
                ],
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 4, top: 12),
                    child: Text(
                      "+998",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  labelText: 'Phone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                onChanged: (value){
                  MaskedInputFormatter('(##) ###-##-##').mask.length;
                },
              ),
              const SizedBox(
                height: 30,
              ),

              /// PAYMENT
              Text(
                "Payment method",
                style: TextStyle(fontSize: 22, fontFamily: Assets.lexend),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  GestureDetector(
                    onLongPress: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  height: 330,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Add card", style: TextStyle(fontFamily: Assets.lexend, fontSize: 20),),

                                      const SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null || value.isEmpty && isCash==false) {
                                              return 'Please fill out this field';
                                            }
                                            return null;
                                          },
                                          style: TextStyle(fontFamily: Assets.lexend),
                                          controller: _CardController,
                                          keyboardType: TextInputType.number,
                                          maxLength: 19,
                                          decoration: InputDecoration(
                                            labelText: 'Card number',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12)
                                            ),
                                          ),
                                        ),
                                      ),
                                      //const SizedBox(height: 20,),
                                      Padding(
                                        padding:const EdgeInsets.symmetric(horizontal: 30.0),
                                        child: TextField(
                                          style: TextStyle(fontFamily: Assets.lexend),
                                          // Set the font size here
                                          controller: _ExpirateController,
                                          decoration: InputDecoration(
                                            labelText: 'Card expiry date',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12)
                                            ),
                                          ),
                                          maxLength: 5,
                                          onChanged: (text) {
                                            if (text.length == 2 && !_ExpirateController.text.endsWith('/')) {
                                              _ExpirateController.text += '/';
                                              _ExpirateController.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _ExpirateController.text.length));
                                            }
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 20,),

                                      Center(
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                            setState(() {
                                              hasCard = true;
                                              cardNumber = _CardController.text;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius: BorderRadius.circular(12)),
                                            height: 40,
                                            width: 150,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontFamily: Assets.lexend),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    onTap: () {
                      setState(() {
                        isCash = false;
                      });

                    },
                    child: ListTile(
                      //tileColor: Colors.grey.shade300,
                      leading: Icon(
                        Icons.credit_card,
                        color: AppColors.mainColor,
                      ),
                      title: CustomText(title: !hasCard ? "Card" : cardNumber),
                      trailing: isCash == false
                          ? Icon(
                              Icons.done,
                              color: AppColors.mainColor,
                            )
                          : const SizedBox.shrink(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 10,
                    indent: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isCash = true;
                      });
                    },
                    child: ListTile(
                      //  tileColor: Colors.grey.shade300,
                      leading: Icon(
                        Icons.money,
                        color: AppColors.mainColor,
                      ),
                      title: const CustomText(title: "Cash"),
                      trailing: isCash
                          ? Icon(
                              Icons.done,
                              color: AppColors.mainColor,
                            )
                          : const SizedBox.shrink(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 10,
                    indent: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              /// TO PAY
              Row(
                children: [
                  Text(
                    "To pay",
                    style: TextStyle(fontSize: 22, fontFamily: Assets.lexend),
                  ),
                  const Spacer(),
                  Text(
                    "\$${widget.totalPrice}",
                    style: TextStyle(fontSize: 22, fontFamily: Assets.lexend),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (!_formKey.currentState!.validate()) {
                    // Process data if all fields are valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Fill address and phone number field')),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Order Created Successfully',
                            style:
                            TextStyle(fontFamily: Assets.lexend, fontSize: 20),
                          ),
                          content: Text(
                            'Your order will be delivered soon for any information you can contact +998 93 000 03 91.',
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
                                    value.clearCart();
                                    value.saveIntoSp();
                                    value.updateCart(value.items);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok"),
                                );
                              },
                            )
                          ],
                        );},
                    );
                  }

                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12)),
                    height: 60,
                    width: 250,
                    alignment: Alignment.center,
                    child: Text(
                      "Pay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: Assets.lexend),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
