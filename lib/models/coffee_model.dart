import 'dart:ui';

class CoffeeModel {
  String name;
  String coName;
  String backgroundImage;
  String imageTop;
  String imageSmall;
  String imageBlur;
  String cupImage;
  String description;
  Color lightColor;
  Color darkColor;
  double price;

  CoffeeModel(
      this.name,
      this.coName,
      this.backgroundImage,
      this.imageTop,
      this.imageSmall,
      this.imageBlur,
      this.cupImage,
      this.description,
      this.lightColor,
      this.darkColor,
      this.price);
}

class CoffeeTakeAway {
  bool showBadge;
  int countCups;

  CoffeeTakeAway(this.showBadge, this.countCups);
}
