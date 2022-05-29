import 'package:flutter/material.dart';
import 'package:bmi_calculator/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF0A0E22),
          scaffoldBackgroundColor: const Color(0xFF0A0E22),
        ));
  }
}
