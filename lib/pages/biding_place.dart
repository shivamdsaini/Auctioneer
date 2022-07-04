// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, no_logic_in_create_state, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, unnecessary_cast, unused_local_variable

import 'package:auctioneer/pages/create_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/material.dart';

class Bidingplace extends StatefulWidget {
  User user;
  Bidingplace({required this.user});
  // const Bidingplace({Key? key} ) : super(key: key);

  @override
  State<Bidingplace> createState() => _BidingplaceState(user: user);
}


class _BidingplaceState extends State<Bidingplace> {
  

   final bider = u.FirebaseAuth.instance.currentUser!;
   
  User user;
  _BidingplaceState({required this.user});


  late int bidprice=user.bidprice ;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SingleChildScrollView(
              // child: Container(
              //   height: size.height,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[500],
                      image: DecorationImage(
                        image: NetworkImage('${user.imgurl}'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        color: Colors.blue),
                                    child: Center(
                                      child: Text("₹ ${user.bidprice}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontFamily: "mont",
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: Expanded(
                      child: Container(
                        height: size.height,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              "Time : ${user.Datetime}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${user.pname}',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${user.pdesc}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                  physics: ClampingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      //   ListView.builder(
                                      //       shrinkWrap: true,
                                      //       physics: ClampingScrollPhysics(),
                                      //       itemCount: _bidList.length,
                                      //       itemBuilder: (_, index) {
                                      //         final String name =
                                      //             _bidList[index]["userName"];
                                      //         final String bidPlaced =
                                      //             _bidList[index]["bidAmount"];

                                      //         return Card(
                                      //             elevation: 5,
                                      //             child: Center(
                                      //               child: Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .spaceBetween,
                                      //                 children: [
                                      //                   Container(
                                      //                     padding: EdgeInsets.all(10),
                                      //                     width: 100,
                                      //                     height: 55,
                                      //                     child: Text(
                                      //                       name,
                                      //                       style: TextStyle(
                                      //                           fontWeight:
                                      //                               FontWeight.bold,
                                      //                           color: Colors.white),
                                      //                     ),
                                      //                   ),
                                      //                   Container(
                                      //                     padding: EdgeInsets.all(10),
                                      //                     width: 100,
                                      //                     height: 55,
                                      //                     child: Text(
                                      //                       "\$ $bidPlaced",
                                      //                       style: TextStyle(
                                      //                           fontWeight:
                                      //                               FontWeight.bold,
                                      //                           color: Colors.red),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ));
                                      //       })
                                      Card(
                                          elevation: 5,
                                          child: Container(
                                            color: Colors.grey,
                                            padding: EdgeInsets.all(10),
                                            width: size.width,
                                            height: 55,
                                            child: Text(
                                              'Seller: ${user.seller}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          )),
                                      Card(
                                          elevation: 5,
                                          child: Container(
                                            color: Colors.grey,
                                            padding: EdgeInsets.all(10),
                                            width: size.width,
                                            height: 55,
                                            child: Text(
                                              'Bidder: ${user.bidder}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          )),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 500,),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.black,
        child: Container(
          child:
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center, 
                children: [
            ElevatedButton(
                  onPressed: () {
                    final docUser=FirebaseFirestore.instance.collection('Users').doc('${user.id}');
                    bidprice+=100;
                    docUser.update({
                      'bidprice':bidprice,
                      'bidder':bider.email,
                    });
                    setState(() { user.bidprice = bidprice;
                    user.bidder=bider.email!;});
                  },
                  
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.red,
                    elevation: 20,
                    primary: Color.fromARGB(255, 189, 55, 100),
                     onPrimary: Colors.grey,
                   ),
                  child: const Text(
                    '₹100',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            SizedBox(
                width: 20,
            ),
            ElevatedButton(onPressed: () {
              final docUser=FirebaseFirestore.instance.collection('Users').doc('${user.id}');
                    bidprice+=500;
                    docUser.update({
                      'bidprice':bidprice,
                      'bidder':bider.email,
                    });
                    setState(() { user.bidprice = bidprice;
                    user.bidder=bider.email!;});
            },
                 
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.red,
                    elevation: 20,
                    primary: Color.fromARGB(255, 189, 55, 100),
                     onPrimary: Colors.grey,
                   ),
                  child: const Text(
                    '₹500',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            SizedBox(
                width: 20,
            ),
            ElevatedButton(onPressed: () {
              final docUser=FirebaseFirestore.instance.collection('Users').doc('${user.id}');
                    bidprice+=1000;
                    docUser.update({
                      'bidprice':bidprice,
                     'bidder':bider.email,
                    });
                    setState(() { user.bidprice = bidprice;
                    user.bidder=bider.email!;});
            },
              
                  
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.red,
                    elevation: 20,
                    primary: Color.fromARGB(255, 189, 55, 100),
                    onPrimary: Colors.grey,
                   ),
                  child: const Text(
                    '₹1000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
          ]),
              ),
        ),
      ),
    );
  }
}
