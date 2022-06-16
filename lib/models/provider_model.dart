import 'package:flutter/material.dart';
import 'package:starbucks_app/models/coffee_model.dart';

final List<CoffeeTakeAway> initialCoffeeCups = List.generate(3, (index) => CoffeeTakeAway(false, 0));

class PageOffsetModel extends ChangeNotifier {
  double _pageOffset = 0;

  double get pageOffset => _pageOffset;

  set pageOffset(double number) {
    _pageOffset = number;
    notifyListeners();
  }
}

class ShowDetailsTrigger extends ChangeNotifier{
  bool _isTrigger = false;

  bool get isTrigger => _isTrigger;

  set isTrigger(bool trigger) {
    _isTrigger = trigger;
    notifyListeners();
  }
}

class PageIndexModel extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int number) {
    _pageIndex = number;
    notifyListeners();
  }
}

class CupsOrderModel extends ChangeNotifier {
  final List<CoffeeTakeAway> _coffeeTakeAway = initialCoffeeCups;

  List<CoffeeTakeAway> get coffeeTakeAway => _coffeeTakeAway;

  void incrementCoffeeCup(int i){
    _coffeeTakeAway[i].countCups++;
    _coffeeTakeAway[i].showBadge = true;
    if( _coffeeTakeAway[i].countCups > 10){
      _coffeeTakeAway[i].countCups = 0;
      _coffeeTakeAway[i].showBadge = false;
    }
    notifyListeners();
  }
  void showBadgeAll(bool badge){
    for(int i = 0; i < 3; i++) {
      _coffeeTakeAway[i].showBadge = badge;
    }
    notifyListeners();
  }
}


