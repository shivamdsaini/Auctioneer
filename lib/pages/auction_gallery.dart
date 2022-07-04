// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_const_literals_to_create_immutables

// import 'dart:ui';

import 'dart:ui';

import 'package:auctioneer/pages/create_post.dart';
//import 'package:auctioneer/pages/date_time_picker.dart';
import 'package:flutter/material.dart';

class AuctionGallery extends StatefulWidget {
  const AuctionGallery({Key? key}) : super(key: key);

  @override
  State<AuctionGallery> createState() => _AuctionGalleryState();
}

class _AuctionGalleryState extends State<AuctionGallery> {
  double x=2.0,y=1.0;
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.90 : 1.00),
      //..rotateZ(isDrawerOpen ? pi / 20 : 0),
      decoration: BoxDecoration(
        color: Color(0xFF121212),
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: SafeArea(
        child: Scaffold(
          // child:Container(alignment: ,),
          backgroundColor: Color(0xFF121212),
          body: Stack(
            children: [
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: NetworkImage(
                        'https://i.imgur.com/E1Otm4t.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new BackdropFilter(
                  
                  filter: new ImageFilter.blur(sigmaX: x, sigmaY: y),
                  child: new Container(
                    decoration:
                        new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 60,),
                    Align(
                      alignment: Alignment.center,
                      child: Text("May you get what you desire!!",
                      style: TextStyle(color:Colors.grey,fontSize: 25,),
                      textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.center,
                      child: Text("To add an auction for your item click the + icon below",
                      style: TextStyle(color: Colors.grey ,fontSize: 20,),
                      textAlign: TextAlign.center,),
                    ),
                     SizedBox(height: 10,),
                    Align(  
                      alignment: Alignment.center,
                      child: Text("The auctions will be held till 30 min from the start time",
                      style: TextStyle(color: Colors.grey ,fontSize: 20,),
                      textAlign: TextAlign.center,),
                    ),
                     SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Bid will increase by ₹100 ₹500 ₹1000",
                      style: TextStyle(color: Colors.grey ,fontSize: 20,),
                      textAlign: TextAlign.center,),
                    ),
                     SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.center,
                      child: Text("In the menu you can catch sight of Upcoming, Active and past Auctions",
                      style: TextStyle(color: Colors.grey ,fontSize: 20,),
                      textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.center,
                      child: Text(" No Need to Run, Bidding is Fun",
                      style: TextStyle(color: Colors.white,fontSize: 30,
                      fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(" Creaters :-",
                style: TextStyle(color: Colors.white,fontSize: 18),),
                Padding(
                  padding: const EdgeInsets.only(left :15.0),
                  child: Text("Shivam Saini",style: TextStyle(color: Colors.white,fontSize:15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left :15.0),
                  child: Text("Shreyans Khabia",style: TextStyle(color: Colors.white,fontSize:15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left :15.0),
                  child: Text("Manan Jain",style: TextStyle(color: Colors.white,fontSize:15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left :15.0),
                  child: Text("Pratik Meena",style: TextStyle(color: Colors.white,fontSize:15),),
                ),
               ],
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                     // margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              child: Icon(
                                Icons.menu,
                                color: Colors.grey,
                                size: 40,
                              ),
                              onTap: () {
                                if (isDrawerOpen) {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    isDrawerOpen = false;
                                    x=1;
                                    y=2;
                                  });
                                } else {
                                  setState(() {
                                    x=0;
                                    y=0;
                                    xOffset = size.width - 120;
                                    yOffset = size.height / 5;
                                    isDrawerOpen = true;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Welcome Auctioneers',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    //FetchPosts(),
                    //  ItemCard(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Color(0xFF121212),
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //    // Navigator.pushNamed(context, HomePage.id);
                    //   },
                    //   icon: Icon(Icons.home,size: 30),
                    //   color: Colors.white,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CreatePost();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.add, size: 45),
                          color: Colors.white),
                    ),
                    // IconButton(
                    //     onPressed: () {
                    //      // Navigator.pushNamed(context, DashBoard.id);
                    //     },
                    //     icon: Icon(Icons.dashboard,size: 30),
                    //     color: Colors.white),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
