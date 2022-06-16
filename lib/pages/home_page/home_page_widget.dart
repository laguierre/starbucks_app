import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_app/pages/details_page/details_page.dart';
import 'dart:math' as math;
import '../../constants.dart';
import '../../data/data.dart';
import '../../models/provider_model.dart';

class TitleCoffee extends StatelessWidget {
  const TitleCoffee({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.13,
      child: RichText(
        text: TextSpan(
          text: coffee[i].name,
          style: TextStyle(
              color: coffee[i].darkColor,
              fontSize: 50,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: coffee[i].coName,
                style: TextStyle(
                    color: coffee[i].lightColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key? key,
    required this.animation,
  }) : super(key: key);

  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        double animatedValue = animation.value;
        return TopLogoStarbucks(animatedValue: animatedValue);
      },
    );
  }
}

class TopLogoStarbucks extends StatelessWidget {
  const TopLogoStarbucks({
    Key? key,
    required this.animatedValue,
  }) : super(key: key);

  final double animatedValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kLogoSideIcons,
      left: 20.0 * animatedValue - (1 - animatedValue) * 30,
      right: 20.0 * animatedValue - (1 - animatedValue) * 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'lib/assets/images/pin.png',
            color: kColorStarbucksGreen,
            height: 33,
          ),
          Image.asset(
            'lib/assets/images/menus.png',
            color: kColorStarbucksGreen,
            height: 33,
          ),
        ],
      ),
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    Key? key,
    required this.size,
    required this.pageIndex,
  }) : super(key: key);

  final Size size;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: size.width * 0.12,
        bottom: 40,
        child: SizedBox(
          height: 50,
          width: 100,
          child: Stack(
            children: [
              CirclePageIndicator(
                isInitialValue: pageIndex == 0 ? true : false,
                endSize: pageIndex == 1
                    ? 0.4 * sizePageIndicatorSelected
                    : 0.4 * sizePageIndicatorSelected,
                startSize: sizePageIndicatorSelected,
                x1: -1.0,
                y1: 1,
                x2: -1.0 * 0.7,
                y2: pageIndex == 2 ? -0.65 : -1 * 0.3,
              ),
              CirclePageIndicator(
                isInitialValue: pageIndex == 1 ? true : false,
                endSize: 0.8 * sizePageIndicatorSelected,
                startSize: sizePageIndicatorSelected,
                x1: 0,
                y1: 1,
                x2: 0,
                y2: 0,
              ),
              CirclePageIndicator(
                isInitialValue: pageIndex == 2 ? true : false,
                endSize: pageIndex == 1
                    ? 0.65 * sizePageIndicatorSelected
                    : 0.5 * sizePageIndicatorSelected,
                startSize: sizePageIndicatorSelected,
                x1: 1,
                y1: 1,
                x2: pageIndex == 0
                    ? 1 * 0.7
                    : pageIndex == 1
                        ? 0.8
                        : 1,
                y2: pageIndex == 0
                    ? -1 * 0.5
                    : pageIndex == 1
                        ? 0
                        : 1,
              )
            ],
          ),
        ));
  }
}

class CirclePageIndicator extends StatelessWidget {
  const CirclePageIndicator({
    Key? key,
    required this.isInitialValue,
    required this.startSize,
    required this.endSize,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
  }) : super(key: key);

  final bool isInitialValue;
  final double startSize, endSize;
  final double x1, y1, x2, y2;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 500),
      alignment: isInitialValue ? Alignment(x1, y1) : Alignment(x2, y2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isInitialValue ? startSize : endSize,
        width: isInitialValue ? startSize : endSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isInitialValue ? kColorStarbucksGreen : Colors.grey,
        ),
      ),
    );
  }
}

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({
    Key? key,
    required this.animation,
    required this.size,
  }) : super(key: key);

  final Animation animation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kLogoTopPadding,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          double height = sizeLogoHome +
              (1 - animation.value) * (sizeLogoSplash - sizeLogoHome);
          return Transform.translate(
            offset: Offset(
                size.width / 2 - height / 2,
                size.height / 2 * (1 - animation.value) -
                    sizeLogoSplash * (1 - animation.value)),
            child: Image.asset(
              'lib/assets/images/logo.png',
              height: height,
            ),
          );
        },
      ),
    );
  }
}

class CoffeeDescription extends StatelessWidget {
  const CoffeeDescription({
    Key? key,
    required this.cardWidth,
    required this.cardHeight,
    required this.size,
    required this.i,
    required this.animateH,
  }) : super(key: key);

  final double cardWidth;
  final double cardHeight;
  final Size size;
  final int i;
  final double animateH;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: cardWidth,
        height: cardHeight,
        bottom: size.height * .15,
        child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: coffee[i].darkColor.withOpacity(0.50),
              borderRadius: BorderRadius.circular(25)),
          child: Transform.translate(
            offset: Offset(-0.6 * animateH, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Frappuccino',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 15),
                Text(
                  coffee[i].description,
                  style: const TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}

class BlurBackgroundImage extends StatelessWidget {
  const BlurBackgroundImage({
    Key? key,
    required this.cardWidth,
    required this.cardHeight,
    required this.size,
    required this.i,
  }) : super(key: key);

  final double cardWidth;
  final double cardHeight;
  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: cardWidth,
        height: cardHeight,
        bottom: size.height * .15,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              coffee[i].backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class CoffeePageView extends StatelessWidget {
  const CoffeePageView({
    Key? key,
    required this.pageController,
    required this.pageValue,
    required this.cardWidth,
    required this.cardHeight,
    required this.size,
    required this.pageIndex,
  }) : super(key: key);

  final PageController pageController;
  final double pageValue;
  final double cardWidth;
  final double cardHeight;
  final Size size;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: (index) {
          Provider.of<PageIndexModel>(context, listen: false).pageIndex = index;
        },
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: coffee.length,
        itemBuilder: (context, i) {
          var priceString = coffee[i].price.toStringAsFixed(2).split('.');
          // y = -4x^2 + 4x (0,0)(0.5,1)(1,0)
          double ec = -4 * pageValue * pageValue + 4 * pageValue;
          ec = Curves.easeOutBack.transform(ec);
          double translateV = 30 * ec;
          double translateH = 30 * ec;
          double rotate = ec * math.pi / 18;
          return GestureDetector(
            onTap: () {
              Provider.of<ShowDetailsTrigger>(context, listen: false)
                  .isTrigger = true;
              Provider.of<CupsOrderModel>(context, listen: false)
                  .showBadgeAll(true);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    // Forward Duration
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),
                    // Reverse Duration
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return DetailsPage(i: i);
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ));
            },
            child: Stack(
              children: [
                TitleCoffee(i: i),
                BlurBackgroundImage(
                    cardWidth: cardWidth,
                    cardHeight: cardHeight,
                    size: size,
                    i: i),
                CoffeeDescription(
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                  size: size,
                  i: i,
                  animateH: translateH,
                ),
                PriceAnimatedContainer(
                  cardHeight: cardHeight,
                  pageIndex: pageIndex,
                  translateH: translateH,
                  cardWidth: cardWidth,
                  priceString: priceString,
                  i: i,
                ),
                CupsOptions(
                  cardHeight: cardHeight,
                  pageIndex: pageIndex,
                  translateH: translateH,
                  i: i,
                ),
                CupImage(
                  rotate: rotate,
                  pageIndex: pageIndex,
                  i: i,
                ),
                BlurImage(
                  size: size,
                  translateV: translateV,
                  i: i,
                ),
                SmallImage(
                  translateV: translateV,
                  size: size,
                  i: i,
                ),
                TopImage(
                  size: size,
                  translateV: translateV,
                  i: i,
                ),
              ],
            ),
          );
        });
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
    required this.size,
    required this.translateV,
    required this.i,
  }) : super(key: key);

  final Size size;
  final double translateV;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: size.width * 0.23 - translateV,
      top: size.height * 0.21,
      child: Hero(
        tag: coffee[i].imageTop,
        child: Image.asset(
          coffee[i].imageTop,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class SmallImage extends StatelessWidget {
  const SmallImage({
    Key? key,
    required this.translateV,
    required this.size,
    required this.i,
  }) : super(key: key);

  final double translateV;
  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 1.1 * translateV,
      bottom: size.height * 0.5,
      child: Hero(
        tag: coffee[i].imageSmall,
        child: Image.asset(
          coffee[i].imageSmall,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class BlurImage extends StatelessWidget {
  const BlurImage({
    Key? key,
    required this.size,
    required this.translateV,
    required this.i,
  }) : super(key: key);

  final Size size;
  final double translateV;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: size.width / 2 - 60 - translateV,
      bottom: size.height * 0.1,
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

class CupImage extends StatelessWidget {
  const CupImage({
    Key? key,
    required this.rotate,
    required this.pageIndex,
    required this.i,
  }) : super(key: key);

  final double rotate;
  final int pageIndex;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 15,
        right: -10,
        child: Transform.rotate(
          angle: rotate,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: pageIndex == i ? 1.0 : 0.8,
            child: Hero(
              tag: coffee[i].cupImage,
              child: Image.asset(
                coffee[i].cupImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ));
  }
}

class CupsOptions extends StatelessWidget {
  const CupsOptions({
    Key? key,
    required this.cardHeight,
    required this.pageIndex,
    required this.translateH,
    required this.i,
  }) : super(key: key);

  final double cardHeight;
  final int pageIndex;
  final double translateH;
  final int i;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        bottom: cardHeight - 300 + 50 + 20,
        left: pageIndex == i ? 60 : 150,
        right: 30,
        child: Transform.translate(
          offset: Offset(-translateH * 0.6, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
                cupsSize.length,
                (j) => Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Hero(
                      tag: '${coffee[i].cupImage}$j',
                      child: Image.asset(cupsSize[j], fit: BoxFit.cover),
                    ))),
          ),
        ));
  }
}

class PriceAnimatedContainer extends StatelessWidget {
  const PriceAnimatedContainer({
    Key? key,
    required this.cardHeight,
    required this.pageIndex,
    required this.translateH,
    required this.cardWidth,
    required this.priceString,
    required this.i,
  }) : super(key: key);

  final double cardHeight;
  final int pageIndex;
  final double translateH;
  final double cardWidth;
  final List<String> priceString;
  final int i;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: cardHeight - 300,
      left: pageIndex == i ? 50 : 150,
      right: 30,
      duration: const Duration(milliseconds: 300),
      child: Transform.translate(
        offset: Offset(-translateH * 0.4, 0),
        child: Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            width: cardWidth,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    kColorDarkGreen,
                    kColorStarbucksGreen,
                  ],
                )),
            child: RichText(
              text: TextSpan(
                text: '\$ ${priceString[0]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: '.${priceString[1]}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            )),
      ),
    );
  }
}