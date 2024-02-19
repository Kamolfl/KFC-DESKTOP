import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfc_desktop/ui/my_home_page/my_home_page.dart';
import 'package:kfc_desktop/ui/second_categories/second_categories.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all(Colors.red),
        ),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

