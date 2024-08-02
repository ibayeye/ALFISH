import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int)? onTap; // Mengambil parameter int untuk onTap

  const BottomNavigation({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> navigationItems = [
      SvgPicture.asset(
        'assets/images/i_report.svg',
        width: 30,
        height: 30,
      ),
      SvgPicture.asset(
        'assets/images/i_home.svg',
        width: 30,
        height: 30,
      ),
      SvgPicture.asset(
        'assets/images/i_insert.svg',
        width: 30,
        height: 30,
      ),
    ];

    return CurvedNavigationBar(
      height: 60,
      color: Colors.black,
      items: navigationItems,
      backgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 300),
      onTap: onTap, // Menangani perubahan halaman saat item di-klik
    );
  }
}
