// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController=TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim(),
      );
      showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text('Password reset link sent! check you email'),
          );
        });
      } on FirebaseAuthException catch (e) {
        print(e);
        showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 128, 121, 121),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 128, 121, 121),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             child: Text('Enter your email and we will send you a password reset link',
             textAlign: TextAlign.center,),
           ),
           SizedBox(height:10),
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
                SizedBox(height:10),
                MaterialButton(
                  onPressed: passwordReset,
                child: Text('Reset Password'),
                color: Color.fromARGB(255, 248, 106, 96),
                ),
         ],
       ),
    );
  }
}