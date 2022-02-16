import 'package:flutter/material.dart';
import 'package:htq_boutique_app/commons/constants.dart';

import 'modules/home/screen/home_page.dart';
import 'modules/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HQT Shop',
      theme: ThemeData(primaryColor: COLORS.kPrimaryColor, primarySwatch: Colors.blue, fontFamily: "Gordita", textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black54))),
      home: const MainScreen(),
    );
  }
}
