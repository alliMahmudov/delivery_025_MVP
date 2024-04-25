
import 'package:delivery_025/constants/imports.dart';

class SPList extends ChangeNotifier{

  List<CartItemSP> _items = List.empty(growable: true);

  List<CartItemSP> get items => _items;

  int _qty = 1;
  int get qty => _qty;

  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;

  SharedPreferences? sp;

  void getSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
  }

  void saveIntoSp() {
    //
    List<String> contactListString =
    items.map((contact) => jsonEncode(contact.toJson())).toList();
    sp?.setStringList('myData', contactListString);
    //
  }

  double calculateTotalAmount(List<CartItemSP> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void saveTotalAmount(double totalAmount) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('totalAmount', totalAmount);
      _totalAmount = totalAmount; // Update the totalAmount in the class
      notifyListeners(); // Notify the listeners (UI)
    } catch (e) {
      print("Error saving data to SharedPreferences: $e");
    }
  }

  void loadTotalAmount() {
    double totalAmount = sp?.getDouble('totalAmount') ?? 0.0;
    _totalAmount = totalAmount;
    notifyListeners();

  }

  void updateCart(List<CartItemSP> cartItems) {
    double totalAmount = calculateTotalAmount(cartItems);
    saveTotalAmount(totalAmount);
  }

  void clearQTY() {
    _qty = 0;
    notifyListeners();
  }

  void incrementQTY(){
    _qty++;
    notifyListeners();
  }

  void decrementQTY(){
    if(_qty > 0) {
      _qty--;
    }
    notifyListeners();
  }

  void addItem(int id, dynamic newItem) {
    bool productExists = false;

    for (int i = 0; i < _items.length; i++) {
      if (items[i].id == id) {
        // Update the quantity if the product already exists
        items[i].quantity += 1;

        _totalAmount += newItem.price;
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      // Add a new entry for the product
      _items.add(newItem);
      _totalAmount += newItem.price;
    }

    notifyListeners();

  }

  void removeItem(int id, dynamic newItem) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].id == id) {
        if (_items[i].quantity > 0) {
          // If the quantity to remove is less than the current quantity, decrement the quantity
          _items[i].quantity -= 1;

          _totalAmount -= newItem.price;
        } if(_items[i].quantity == 0) {
          // If the quantity to remove is equal to or greater than the current quantity, remove the item
          _items.remove(newItem);
           // Decrement the index to stay within bounds after item removal
          _totalAmount -= newItem.price;
        }
        break; // Exit the loop after updating/removing the item
      }
    }
    notifyListeners();
  }

  void deleteItem(dynamic cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }

  void readFromSp() {
    //
    List<String>? contactListString = sp?.getStringList('myData');
    if (contactListString != null) {
      _items = contactListString
          .map((contact) => CartItemSP.fromJson(json.decode(contact)))
          .toList();
    }
    //
  }

  void clearCart() async {
    _items.clear();
    notifyListeners();
  }
}