// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, unused_local_variable, sized_box_for_whitespace, unused_import, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations, no_logic_in_create_state, unused_field, avoid_print

import 'dart:async';

import 'package:auctioneer/pages/biding_place.dart';
import 'package:auctioneer/pages/create_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  User user;
  ItemCard({required this.user});
  // const ItemCard({Key? key,required this.user}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState(user: user);
}

class _ItemCardState extends State<ItemCard> {
  User user;
  _ItemCardState({required this.user});
  final itemSize = 100.0;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        final docRef =
            FirebaseFirestore.instance.collection("Users").doc('${user.id}');
        docRef.get().then(
          (DocumentSnapshot doc) {
            //  user.bidprice = doc.data() as Map<String, dynamic>;
            user = User.fromJson(doc.data() as Map<String, dynamic>);
          },
          onError: (e) => print("Error getting document: $e"),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(30),
          elevation: 6.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // gradient: LinearGradient(
              //   colors: [
              //     Color(0xFF0d324d),
              //     Color(0xFF7f5a83),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              //color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
              //  [_random.nextInt(9) * 100],
              color: Color(0xFF7a6c62),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "${user.pname}",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${user.Datetime}",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.bookmark_border_rounded),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${user.imgurl}'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    height: 181.0,
                  ),
                ),
                Container(
                    child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Current Bidding Price: ₹${user.bidprice}",
                      style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${user.pdesc}",
                      style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      //border: Border.all(color: Colors.grey),
                      color: Color(0xFF2e2e2e),
                    ),
                    child: ButtonBar(
                      children: [
                        TextButton(
                          child: const Text(
                            'Place a Bid!',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'sans-serif',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Bidingplace(user: user);
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
