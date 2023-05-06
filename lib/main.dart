
import 'package:exam_train_api/screen/detail/view/detail_screen.dart';
import 'package:exam_train_api/screen/home/provider/home_provider.dart';
import 'package:exam_train_api/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const detailScreen(),
          '/': (context) => const homescreen()
        },
      ),
    ),
  );
}