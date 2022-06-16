import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data/data.dart';
import '../../models/provider_model.dart';

class LogoFixed extends StatelessWidget {
  const LogoFixed({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kLogoTopPadding,
      left: size.width / 2 - sizeLogoHome / 2,
      child: Image.asset(
        'lib/assets/images/logo.png',
        height: sizeLogoHome,
      ),
    );
  }
}

class BadgeCups extends StatelessWidget {
  const BadgeCups({
    Key? key,
    required this.j,
    required this.index,
  }) : super(key: key);
  final int j;
  final int index;

  @override
  Widget build(BuildContext context) {
    int count =
        Provider.of<CupsOrderModel>(context).coffeeTakeAway[j].countCups;
    bool show =
        Provider.of<CupsOrderModel>(context).coffeeTakeAway[j].showBadge;
    return Badge(
      showBadge: show && count != 0 ? true : false,
      position: BadgePosition.topEnd(top: -15, end: -17),
      padding: const EdgeInsets.all(7),
      badgeContent: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      badgeColor: kColorStarbucksGreen,
      child: SizedBox(
        height: 45,
        child: Hero(
            tag: '${coffee[index].cupImage}$j',
            child: Image.asset(cupsSize[j], fit: BoxFit.cover)),
      ),
    );
  }
}

class BlurImageDetails extends StatelessWidget {
  const BlurImageDetails({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      top: size.height * 0.14,
      child: Hero(
        tag: coffee[i].imageBlur,
        child: Image.asset(
          coffee[i].imageBlur,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class SmallDetailsCoffee extends StatelessWidget {
  const SmallDetailsCoffee({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      top: size.height * 0.17,
      child: Hero(
        tag: coffee[i].imageSmall,
        child: RotatedBox(
          quarterTurns: 1,
          child: Image.asset(
            coffee[i].imageSmall,
          ),
        ),
      ),
    );
  }
}

class TopImageDetails extends StatelessWidget {
  const TopImageDetails({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: size.width * 0.6,
      top: 10,
      child: Hero(
        tag: coffee[i].imageTop,
        child: Transform.rotate(
          angle: 90,
          child: Image.asset(
            coffee[i].imageTop,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

class DescriptionCoffee extends StatelessWidget {
  const DescriptionCoffee({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 205,
      right: 20,
      child: SizedBox(
        width: size.width,
        child: AutoSizeText(
          maxLines: 4,
          coffee[i].description,
          style: const TextStyle(fontSize: 20, color: Colors.white70),
          minFontSize: 16,
        ),
      ),
    );
  }
}

class NameCoffee extends StatelessWidget {
  const NameCoffee({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: coffee[i].name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: coffee[i].coName,
                    style: TextStyle(
                        color: coffee[i].darkColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Frappuccino',
            style: TextStyle(
                letterSpacing: 1.2,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CupDetailImage extends StatelessWidget {
  const CupDetailImage({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.45,
      right: size.width * 0.2,
      bottom: -size.height / 2.8,
      child: Transform.scale(
        scale: 1.1,
        child: GestureDetector(
          onTap: () {
            Provider.of<CupsOrderModel>(context, listen: false)
                .showBadgeAll(false);
            Navigator.of(context).pop();
          },
          child: Image.asset(
            coffee[i].cupImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    Key? key,
    required this.size,
    required this.animation,
    required this.princeString,
  }) : super(key: key);

  final Size size;
  final Animation animation;
  final List<String> princeString;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        top: size.height * (-0.44 * animation.value + 1),
        //size.height * 0.56,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: size.width,
          height: size.height * 0.08,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xFF067655),
                Color(0xFF033B2B),
              ]),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                    text: '\$ ${princeString[0]}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: '.${princeString[1]}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ]),
              ),
              const Spacer(),
              const Text(
                "Order",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: size.height * 0.2,
        width: size.width,
        decoration: const BoxDecoration(borderRadius: kBorderRadiusDetails),
        child: ClipRRect(
          borderRadius: kBorderRadiusDetails,
          child: Image.asset(
            coffee[i].backgroundImage,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                coffee[i].darkColor,
                coffee[i].lightColor,
              ],
            )));
  }
}
