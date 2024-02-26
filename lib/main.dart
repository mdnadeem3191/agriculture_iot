import 'package:agriculture_web/screen/home.dart';
import 'package:agriculture_web/theme/theme_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = ThemeColors();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agriculture Monitoring',
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: themeColors.themeColorCustom,
          primaryColor: themeColors.themeColorCustom[800],
        ),
        home: const Dashboard());
  }
}
