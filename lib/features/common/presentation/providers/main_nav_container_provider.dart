import 'package:flutter/material.dart';

class MainNavContainerProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }
  void changeToCategory(){
    changeIndex(1);
  }
  void changeToHome(){
    changeIndex(0);
  }
}
