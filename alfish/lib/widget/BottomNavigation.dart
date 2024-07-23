import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int)? onTap;

  const BottomNavigation({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> navigationItems = [
      const Icon(
        Icons.file_open,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      const FaIcon(
        FontAwesomeIcons.fishFins,
        size: 30,
        color: Colors.white,
      ),
    ];

    return CurvedNavigationBar(
      height: 60,
      color: Colors.black,
      items: navigationItems,
      backgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 300),
      onTap: onTap,
    );
  }
}
