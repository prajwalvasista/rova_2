import 'package:flutter/material.dart';
import 'package:rova_2/routers.dart';
import 'package:rova_2/utils/constants/fonts.dart';
import 'package:rova_2/views/seller_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rova_2.0',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Fonts.dmsans,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: const SellerHome(),
    );
  }
}
