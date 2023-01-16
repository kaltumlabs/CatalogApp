import 'package:codepur/Pages/CartPage.dart';
import 'package:codepur/Pages/FavouritePage.dart';
import 'package:codepur/Pages/homePage.dart';
import 'package:codepur/Pages/loginPage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final pages = [
    const MyHomePage(),
    const FavProduct(),
    const CartProduct(),
    LoginPage(),
  ];
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Vx.zinc100,
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: Colors.transparent,
        items: [
          /// Home
          DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey),

          /// Likes
          DotNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              selectedColor: Colors.pink,
              unselectedColor: Colors.grey),

          /// Search
          DotNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey),

          /// Profile
          DotNavigationBarItem(
              icon: const Icon(Icons.person),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey),
        ],
      ),
    );
  }
}
