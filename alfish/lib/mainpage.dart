import 'package:alfish/insert.dart';
import 'package:alfish/report.dart';
import 'package:alfish/widget/ProductCard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1; // Mengatur default halaman utama setelah login

  // Daftar halaman sesuai dengan indeks dari BottomNavigation
  final List<Widget> _pages = [
    ReportPage(),
    MainContentPage(),
    InsertPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xe8e8e8e8),
      body: SafeArea(
        child: _pages[_selectedIndex], // Menampilkan halaman yang sesuai dengan indeks
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.black,
        items: [
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
        ],
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped, // Menangani perubahan halaman saat item di-klik
        index: _selectedIndex, // Menentukan halaman yang aktif setelah login
      ),
    );
  }
}

class MainContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Welcome back, ALFISH!",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  "All of products",
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(fontSize: 14),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        ProductCard(
          productName: 'Nama produk',
          productPrice: 'Harga produk',
          imagePath:
              'assets/images/landing.png', // Ganti dengan path gambar Anda
          icon: Icons.add,
        ),
        // Tambahkan lebih banyak ProductCards jika diperlukan
      ],
    );
  }
}
