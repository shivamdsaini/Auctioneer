// ignore_for_file: avoid_print, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, library_private_types_in_public_api, use_key_in_widget_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:auctioneer/pages/active_bid.dart';
import 'package:auctioneer/pages/future_bid.dart';
import 'package:auctioneer/pages/past_bid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget {
  final IconData icon;
  final String text;
  final double sizeFont;
  final void Function()? onTap;
  const OptionBar(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.sizeFont});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400],size: 31),
          SizedBox(
            width: 15,
          ),
          Text(text, style: TextStyle(color: Colors.white, fontSize: sizeFont))
        ],
      ),
    );
  }
}


class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final user = FirebaseAuth.instance.currentUser!;
  // final _firestore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  // late User loggedInUser;
  // // late String userName;
  // // late String userEmail;

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() async {
  //   try {
  //     final user = _auth.currentUser!;
  //     loggedInUser = user;

  //     print(loggedInUser.email);
  //     // print(user.displayName);
  //     //final userName = loggedInUser.displayName!;
  //     // userEmail = loggedInUser.email!;
  //     // print(loggedInUser.displayName);
  //     _firestore.collection('user').add({
  //      // 'userName': loggedInUser.displayName,
  //       'userEmail': loggedInUser.email,
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFF36454F),
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 20, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //width: size.width,
            Container(
              width: size.width,
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     // CircleAvatar(
              //     //   child: Icon(
              //     //     Icons.person,
              //     //     color: Colors.white,
              //     //   ),
              //     //   radius: 40,
              //     // ),
              //     // SizedBox(
              //     //   height: 10,
              //     // ),
              //     // Text(

              //     //  // loggedInUser.displayName!,
              //     //   style: TextStyle(
              //     //       color: Colors.white,
              //     //       fontSize: 20,
              //     //       fontWeight: FontWeight.bold),
              //     // ),
              //     // Text(
              //     //   loggedInUser.email!,
              //     //   style: TextStyle(color: Colors.white, fontSize: 15),
              //     // )
              //   ],
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(right :10),
              child: Column(
                children: [
                  OptionBar(
                      icon: Icons.monetization_on_rounded,
                      text: "Acitve Bids",
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                         return ActiveBids();
                        },
                        ),
                        );
                      },
                      //Color:Colors.green,
                      sizeFont: 22),
                  SizedBox(
                    height: 40,
                  ),
                  OptionBar(
                      icon: Icons.check_circle_rounded,
                      text: "Past Bids",
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                         return PastBids();
                        },
                        ),
                        );
                      },
                      sizeFont: 22),
                  SizedBox(
                    height: 40,
                  ),
                  OptionBar(
                      icon: Icons.access_time_filled_rounded,
                      text: "Upcoming Bids",
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                         return FutureBids();
                        },
                        ),
                        );
                      },
                      sizeFont: 22),
                  SizedBox(
                    height: 40,
                  ),
                  OptionBar(
                      icon: Icons.logout_rounded,
                      text: "LogOut",
                      onTap: () {
                      FirebaseAuth.instance.signOut();
                      },
                      sizeFont: 22),
                  SizedBox(
                    height: 330,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
