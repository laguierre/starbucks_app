import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../data/data.dart';
import '../../models/provider_model.dart';
import '../home_page/home_page_widget.dart';
import 'details_page_widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.i}) : super(key: key);

  final int i;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var princeString = coffee[widget.i].price.toStringAsFixed(2).split('.');
    int i = widget.i;
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body: SafeArea(
          child: Stack(children: [
            LogoFixed(size: size),
            const TopLogoStarbucks(animatedValue: 1),
            CoffeeAnimatedContainer(animation: animation, size: size, i: i, princeString: princeString)
          ]),
        ));
  }
}

class CoffeeAnimatedContainer extends StatelessWidget {
  const CoffeeAnimatedContainer({
    Key? key,
    required this.animation,
    required this.size,
    required this.i,
    required this.princeString,
  }) : super(key: key);

  final Animation animation;
  final Size size;
  final int i;
  final List<String> princeString;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        return Positioned(
            top: size.height * (-0.87 * animation.value + 1),
            //y = -0,87x + 1
            bottom: 0,
            child: SizedBox(
              width: size.width,
              child: Stack(
                children: [
                  GradientBackground(i: i),
                  ImageBackground(size: size, i: i),
                  PriceContainer(size: size, animation: animation, princeString: princeString),
                  CupDetailImage(size: size, i: i),
                  NameCoffee(i: i),
                  DescriptionCoffee(size: size, i: i),
                  TopImageDetails(size: size, i: i),
                  SmallDetailsCoffee(size: size, i: i),
                  BlurImageDetails(size: size, i: i),
                  Positioned(
                    top: size.height * 0.35,
                    right: 0,
                    left: 0,
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            for (int j = 0; j < cupsSize.length; j++)
                              Container(
                                  width: 80,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(40),
                                    border:
                                        Border.all(color: Colors.white),
                                    color: const Color(0xFF81554E),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        child:
                                            BadgeCups(index: i, j: j),
                                      ),
                                      const SizedBox(height: 15),
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<CupsOrderModel>(
                                                  context,
                                                  listen: false)
                                              .incrementCoffeeCup(j);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                const Color(0xFF067655),
                                            border: Border.all(
                                                width: 1.8,
                                                color: Colors.white),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(
                                                            40),
                                                    bottomLeft:
                                                        Radius.circular(
                                                            40)),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.add,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                          ]),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
