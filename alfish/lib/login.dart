import 'dart:convert';

import 'package:alfish/mainpage.dart';
import 'package:alfish/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true; // Variabel untuk mengatur tampilan password
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  String? _errorMessage;

  void loginUser() async {
    setState(() {
      // Validasi input sebelum mengirim permintaan
      _isEmailValid = emailController.text.isNotEmpty;
      _isPasswordValid = passwordController.text.isNotEmpty;
    });

    if (_isEmailValid && _isPasswordValid) {
      // Lakukan registrasi
      var reqBody = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      try {
        var response = await http.post(
          Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody),
        );

        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          if (responseData['status']) {
            // Jika berhasil, tampilkan dialog sukses dan arahkan ke halaman login
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Login Berhasil'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            setState(() {
              _errorMessage = responseData['message'] ?? 'Terjadi kesalahan';
            });
          }
        } else {
          setState(() {
            _errorMessage = 'Email atau password salah';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Terjadi kesalahan';
        });
      }
    }
  }

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
                margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                    if (!_isEmailValid)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Email harus diisi!",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    if (!_isPasswordValid)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Password harus diisi!",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Don't have an account yet?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
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
