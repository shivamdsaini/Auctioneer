// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:auctioneer/pages/auction_gallery.dart';
import 'package:auctioneer/pages/side_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
return Scaffold(
       // backgroundColor: Color(0xFF28282B),
        body: Stack(
          children: [
            SideBar(),
            AuctionGallery(),
          ],
        ));   
  }
}