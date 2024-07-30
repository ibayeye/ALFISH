import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 50),
              width: 150,
              height: 150,
              child: Center(
                child: SvgPicture.asset('assets/images/i_login.svg'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 24),
              margin: EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'email',
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 24),
              margin: EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'password',
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              width: 577,
              height: 58,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    backgroundColor: Colors.black),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.only(left: 125),
              child: Row(
                children: [
                  Text("don't have an account yet?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Or Login With Google',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Color(0xffD9D9D9),
                  ),
                  child: SvgPicture.asset('assets/images/google.svg')),
            ),
          ],
        ),
      ),
    );
  }
}
