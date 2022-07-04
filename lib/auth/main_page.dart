// ignore_for_file: prefer_const_constructors

import 'package:auctioneer/auth/auth_page.dart';
import 'package:auctioneer/pages/home_page.dart';
// import 'package:auctioneer/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),

      builder: (context,snapshot){
         if(snapshot.hasData){
            return HomePage();
         }else{
            return AuthPage();
         }
      },
      ),
    );
  }
}