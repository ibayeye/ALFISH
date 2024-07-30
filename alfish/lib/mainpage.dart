import 'package:alfish/widget/BottomNavigation.dart';
import 'package:alfish/widget/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xe8e8e8e8),
      body: SafeArea(
        child: Column(
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
            SizedBox(
              height: 10,
            ),
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
                  'assets/images/landing.png', // Replace with your image path
              icon: Icons.add,
            ),
            // Add more ProductCards as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        onTap: (index) {
          // Tangani navigasi tap di sini
        },
      ),
    );
  }
}
