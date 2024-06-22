import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  bool iskedu=false;
  bool isapple=false;
  bool isananas=false;
  bool isTomato=false;


  void changeData(String tag){
    if(tag=="kedu"){
      iskedu =true;
    }else if(tag=="apple"){
      isapple =true;
    }else if(tag=="ananas"){
      isananas =true;
    }else if(tag=="Tomato"){
      isTomato =true;
    }

    notifyListeners();
  }

  void changeCounter(bool isAdd) {
    if (isAdd) {
      count++;
    } else {
      count--;
    }

    notifyListeners();
  }
}
