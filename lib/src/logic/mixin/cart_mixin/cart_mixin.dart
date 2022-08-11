import 'package:engagementwallet/src/logic/models/cart_model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartMixin extends ChangeNotifier {
  int _quantity = 1;
  late int _amount;
  late int _calculatedAmount = 0;
  late int? _checkedValue = 0;
  late bool? _isChecked = false;
  List<Map<String, dynamic>> _cartList = [];
  List<Map<String, String>> _addressList = [];
  List<CartModel>  _intitialList = [];

  int get quantity => _quantity;
  int get amount => _amount;
  int get checkedValue => _checkedValue!;
  bool get isChecked => _isChecked!;
  int get calculatedAmount => _calculatedAmount;
  List<Map<String, dynamic>> get cartList => _cartList;
  List<CartModel>get intitialList => _intitialList;
  List<Map<String, String>> get addressList => _addressList;


  static BuildContext? _context;


  removeAddressFromList(String? address){
    _addressList.removeWhere((element) => element['address'] == address);
    notifyListeners();
  }

  setChecked(bool? checked, int? index){
    _isChecked = checked;
    _checkedValue = index;
    notifyListeners();
  }

  reduceCartPrice(int objIndex){
    if (_cartList[objIndex]['quantity'] > 1) {
      _cartList[objIndex]['quantity'] -= 1;
      _cartList[objIndex]['amount'] -=  _intitialList[objIndex].amount;
      calculateSumInCart();
    }
    print('list$_cartList');

    notifyListeners();
  }

  addCartPrice(int objIndex){
    _cartList[objIndex]['quantity'] += 1;
    _cartList[objIndex]['amount'] +=  _intitialList[objIndex].amount;
    calculateSumInCart();
    notifyListeners();
  }

  removeItemFromList(String id){
   _cartList.removeWhere((element) => element['id'] == id);
     notifyListeners();
  }

  calculateSumInCart() {
   _calculatedAmount = _cartList.map((item) => item['amount']).reduce((a, b) => a + b);

  }


  setCartList(Map<String, dynamic> cartItems) {
    List<CartModel> cartModel = (_cartList).map((e) => CartModel.fromJson(e)).toList();
    CartModel items = CartModel.fromJson(cartItems);
    var existing = cartModel.where((itemToCheck) => itemToCheck.id == items.id).length;
    if(existing > 0){
      debugPrint('already in list');
    } else{
      _cartList.add(cartItems);
      _intitialList.add(items);
      print('_cartList:$_cartList');
    }
  }

  setNewAddressList(Map<String, String> addressItems) {
    _addressList.add(addressItems);
    print('list: $addressList');
    notifyListeners();
  }

  //Set price
  setPrice(int price) {
    _quantity = price;
    notifyListeners();
  }

  //Add price by 1
  addPrice() {
    _quantity += 1;
    notifyListeners();
  }

  //Reduce price by 1
  reducePrice() {
    if (_quantity > 1) {
      _quantity -= 1;
    }
    notifyListeners();
  }

  //Set amount 1
  setAmount(int amount) {
    _amount = amount;
  }



  //Increase amount
  increaseAmount(int newAmount) {
    _amount = amount + newAmount;
    notifyListeners();
  }

  //Reduce amount
  reduceAmount(int newAmount) {
    if(amount > newAmount){
      _amount = amount - newAmount ;
      notifyListeners();
    }

  }

  static CartMixin cartProvider(BuildContext context, {bool listen = false}) {
    _context = context;
    return Provider.of<CartMixin>(context, listen: listen);
  }
}
