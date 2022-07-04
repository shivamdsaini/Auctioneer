// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:auctioneer/pages/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  final VoidCallback showRegisterPage;
  
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final _emailController= TextEditingController();
    final _passwordController= TextEditingController();
  
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );
  }
  
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
             // SizedBox(height: 25),
              Row(
                children: [
                  Text('    Hello Auctioneer! ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                   fontSize: 32,
                   color:Colors.white ,),
                  ),
                  Icon(
                  Icons.waving_hand,
                  size: 30,
                  color: Colors.white,
              ),
                ],
              ),
              SizedBox(height: 10),
              Text('Welcome back you\'ve been missed!',
              style: TextStyle(
               fontSize: 20,
               color:Colors.white),
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 130, 188, 235)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  )
                ),
              ),

              SizedBox(height : 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 130, 188, 235)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                  )
                ),
              ),

              SizedBox(height : 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return ForgotPasswordPage();
                        },
                        ),
                        );
                      },
                      child: Text('Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 1, 247, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),),
                    ),
                  ],
                ),
              ),

              SizedBox(height : 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                 onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 145, 226, 247),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text('Sign-In',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),)),
                  ),
                ),
              ),

              SizedBox(height : 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                  style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color:Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(' Register now',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 247, 255),
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
