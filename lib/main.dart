import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/item_hidden_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';
import 'package:portfolio/Pages/HomePage.dart';
import 'package:portfolio/Pages/about.dart';
import 'package:portfolio/Pages/experience.dart';
import 'package:portfolio/Pages/login.dart';
import 'package:portfolio/Pages/projects.dart';
import 'package:portfolio/Pages/projects2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hidden(),
    );
  }
}

class Hidden extends StatefulWidget {
  const Hidden({super.key});

  @override
  State<Hidden> createState() => _HiddenState();
}

class _HiddenState extends State<Hidden> {
  List<ScreenHiddenDrawer> _pages = [];

  final myTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Homepage",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Experience",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        const ExperiencePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Projects",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        const Project2(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      disableAppBarDefault: true,
      backgroundColorMenu: const Color.fromARGB(255, 102, 183, 58),
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
    );
  }
}
