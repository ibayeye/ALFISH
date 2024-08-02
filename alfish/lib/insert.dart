import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
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
                  "Insert Page",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Konten lainnya untuk halaman InsertPage
          ],
        ),
      ),
    );
  }
}
