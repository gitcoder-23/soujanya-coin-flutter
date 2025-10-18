import 'package:flutter/material.dart';
import 'package:saujanya/constants/colors.dart';

import 'routes/page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soujanya Coins',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
      ),
      onGenerateRoute: PageRoutes.generateRoute,
    );
  }
}
