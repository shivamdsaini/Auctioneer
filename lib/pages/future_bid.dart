// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:auctioneer/pages/create_post.dart';
import 'package:auctioneer/pages/item_card.dart';
import 'package:flutter/material.dart';

class FutureBids extends StatefulWidget {
  const FutureBids({Key? key}) : super(key: key);

  @override
  State<FutureBids> createState() => _FutureBidsState();
}

class _FutureBidsState extends State<FutureBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Bids'),
         backgroundColor: Color(0xFF121212),
         elevation: 0,
      ),
       backgroundColor: Color(0xFF121212),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: StreamBuilder<List<User>>(
           stream: readUsers(),
           builder: (context ,snapshot){
            if(snapshot.hasError){
              return Text('Something went wrong!');
            }else if(snapshot.hasData){
              final users=snapshot.data!;
              return SingleChildScrollView(
                child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                 
                  children:users.map(buildUserFut).toList(),
                  
                ),
              );
            }else{
              return Padding(
                padding: const EdgeInsets.only(top: 290),
                child: Center(child: CircularProgressIndicator(color: Colors.white,)),
              );
            }
           },
        ),
      ),
    );
  }
}