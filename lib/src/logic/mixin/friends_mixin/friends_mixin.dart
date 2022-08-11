
import 'package:engagementwallet/src/logic/models/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsMixin extends ChangeNotifier {
  final List<Map<String, String>> _friendsList = friendList;


  List<Map<String, String>> get friendsList => _friendsList;



  static BuildContext? _context;



  removeItemFromList(String? id){
    _friendsList.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }

  setFriendList(Map<String, String> friendItems) {
    _friendsList.add(friendItems);
    notifyListeners();
  }


  static FriendsMixin friendProvider(BuildContext context, {bool listen = false}) {
    _context = context;
    return Provider.of<FriendsMixin>(context, listen: listen);
  }
}
