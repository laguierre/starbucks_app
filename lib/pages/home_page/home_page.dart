import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_app/constants.dart';

import '../../models/provider_model.dart';
import 'home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController pageController = PageController(viewportFraction: 0.82);
  late AnimationController animationController;
  late Animation animation;

  double pageValue = 0.0;
  double pageOffset = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOutBack);
    animationController.forward();
    pageController.addListener(pageOffsetListener);
    super.initState();
  }

  void pageOffsetListener() {
    Provider.of<PageOffsetModel>(context, listen: false).pageOffset =
        pageController.page! - pageController.page!.truncate();
    for (pageValue = pageController.page!; pageValue > 1;) {
      pageValue--;
    }
  }

  @override
  void dispose() {
    pageController.removeListener(pageOffsetListener);
    pageController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double cardWidth = size.width - 60;
    double cardHeight = size.height * .55;
    pageOffset = Provider.of<PageOffsetModel>(context).pageOffset;
    int pageIndex = Provider.of<PageIndexModel>(context).pageIndex;

    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackGroundColor,
      body: Stack(
        children: [
          TopAppBar(animation: animation),
          CoffeePageView(pageController: pageController, pageValue: pageValue, cardWidth: cardWidth, cardHeight: cardHeight, size: size, pageIndex: pageIndex),
          LogoAnimation(animation: animation, size: size),
          CustomPageIndicator(size: size, pageIndex: pageIndex),
        ],
      ),
    ));
  }
}


