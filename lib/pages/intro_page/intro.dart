import 'package:flutter/material.dart';
import 'package:starbucks_app/pages/home_page/home_page.dart';

import '../../constants.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400), () {
      // to next page and close this page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            //return const HomePage();
            return const HomePage();
          },
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Center(
        child: Image.asset(
          'lib/assets/images/logo.png',
          height: sizeLogoSplash,
        ),
      ),
    );
  }
}
