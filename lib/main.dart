import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_app/constants.dart';
import 'package:starbucks_app/pages/intro_page/intro.dart';

import 'models/provider_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kBackGroundColor, // status color bar
    statusBarIconBrightness: Brightness.dark, // status bar icon color
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageOffsetModel()),
        ChangeNotifierProvider(create: (_) => PageIndexModel()),
        ChangeNotifierProvider(create: (_) => CupsOrderModel()),
        ChangeNotifierProvider(create: (_) => ShowDetailsTrigger()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IntroPage(),
      ),
    );
  }
}
