import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String imagePath;
  final IconData icon;

  const ProductCard({
    required this.productName,
    required this.productPrice,
    required this.imagePath,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xe3e3e3e3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xd9d9d9d9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  imagePath, // Add your image asset path here
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName, style: GoogleFonts.poppins(fontSize: 12)),
                    Text(productPrice, style: GoogleFonts.poppins(fontSize: 12)),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(icon, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}