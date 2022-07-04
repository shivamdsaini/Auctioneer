import 'package:auctioneer/pages/loginpage.dart';
import 'package:auctioneer/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage=true;

  void toggleScreen(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
     if(showLoginPage){
        return LoginPage(showRegisterPage: toggleScreen);
     }else{
        return RegisterPage(showLoginPage: toggleScreen);
     }  
  }
}