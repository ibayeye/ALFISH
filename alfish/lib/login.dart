import 'package:alfish/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // Variabel untuk mengatur tampilan password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/i_login.svg',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: TextField(
                  obscureText: _obscureText, // Mengatur apakah password tersembunyi atau tidak
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText; // Mengubah status tampilan password
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      backgroundColor: Colors.black),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account yet?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('Or Login With Google', style: TextStyle(fontSize: 18)),
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color(0xffD9D9D9),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/google.svg',
                      width: 50,
                      height: 50,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
