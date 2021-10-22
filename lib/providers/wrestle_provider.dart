import 'package:flutter/material.dart';

class WrestleProvider with ChangeNotifier{
  late double _screenHeight;
  Color? winnerColor;
  double get screenHeight => _screenHeight;
  late double topContainerHeight = _screenHeight/2;

  set screenHeight(double value) {
    _screenHeight = value;
  }

  void increaseTopHeight(){
    if(topContainerHeight<screenHeight){
      topContainerHeight += 20;
    }
    notifyListeners();
  }
  void decreaseTopHeight(){
    if(topContainerHeight>0) {
      topContainerHeight -= 20;
    }
    notifyListeners();
  }
  void replay (){
    topContainerHeight = _screenHeight/2;
    notifyListeners();
  }

}