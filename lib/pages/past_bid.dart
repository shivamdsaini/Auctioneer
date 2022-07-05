// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:auctioneer/pages/create_post.dart';
import 'package:auctioneer/pages/item_card.dart';
import 'package:flutter/material.dart';

class PastBids extends StatefulWidget {
  const PastBids({Key? key}) : super(key: key);

  @override
  State<PastBids> createState() => _PastBidsState();
}

class _PastBidsState extends State<PastBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Bids'),
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
                 
                  children:users.map(buildUserPast).toList(),
                  
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
