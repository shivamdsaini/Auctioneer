// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, sized_box_for_whitespace, avoid_init_to_null, prefer_typing_uninitialized_variables, use_build_context_synchronously, unnecessary_string_interpolations, avoid_unnecessary_containers, avoid_web_libraries_in_flutter, unused_import, unnecessary_null_comparison, camel_case_types

// import 'dart:ffi';

import 'dart:convert';
import 'dart:io';
// import 'dart:js';
import 'package:auctioneer/pages/item_card.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'biding_place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isLoading = false;
  File? image;
  // image=null;
  // File? image;
  var imageURL;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e ');
    }
  }

  Future pickimageCam() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to Open camera: $e ');
    }
  }

  DateTime? pickedDate; // date picked by user
  TimeOfDay? pickedTime; // time picked by user
  DateTime?
      pickedDateTime; // using pickedDate and pickedTime to generate equivalent dateTime

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _minpriceController = TextEditingController();
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _minpriceController.dispose();
    super.dispose();
  }

  final emailll = FirebaseAuth.instance.currentUser!;
  // debugPrint('movieTitle: $pickedDateTime');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: Color(0xFF36454F),
          title: Text('         Create Post'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                image != null
                    ? ClipOval(
                        child: Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ))
                    : Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.white, size: 140),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => pickImage(),
                        child: Icon(
                          Icons.image_outlined,
                          color: Color.fromARGB(255, 189, 55, 100),
                          size: 50,
                        )),
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () => pickimageCam(),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Color.fromARGB(255, 84, 139, 175),
                          size: 50,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 130, 188, 235)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Title',
                        fillColor: Colors.white,
                        filled: true,
                      )),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                      controller: _descController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 130, 188, 235)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Description',
                        fillColor: Colors.white,
                        filled: true,
                      )),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                      controller: _minpriceController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 130, 188, 235)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Min Price',
                        fillColor: Colors.white,
                        filled: true,
                      )),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(
                          Duration(days: 1),
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 7)),
                        builder: (context, child) => Theme(
                          data: ThemeData().copyWith(
                              //  textTheme: TextTheme(
                              //    bodyText1: TextStyle(fontSize: 40.0), // <-- here you can do your font smaller
                              //    bodyText2: TextStyle(fontSize: 40.0)
                              // ),

                              colorScheme: ColorScheme.dark(
                                primary: Color.fromARGB(255, 187, 182, 182),
                                onPrimary: Colors.black12,
                                surface: Color.fromARGB(255, 187, 182, 182),
                                onSurface: Colors.blueGrey,
                              ),
                              dialogBackgroundColor:
                                  Color.fromARGB(255, 0, 0, 0)),
                          child: child!,
                        ),
                      );
                      if (pickedDate != null) {
                        pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (context, child) => Theme(
                            data: ThemeData().copyWith(
                                textTheme: TextTheme(
                                    bodyText1: TextStyle(
                                        fontSize:
                                            20.0), // <-- here you can do your font smaller
                                    bodyText2: TextStyle(fontSize: 20.0)),
                                colorScheme: ColorScheme.dark(
                                  primary: Color.fromARGB(255, 136, 127, 127),
                                  onPrimary: Colors.black12,
                                  surface: Colors.black,
                                  onSurface: Colors.blueGrey,
                                ),
                                dialogBackgroundColor:
                                    Color.fromARGB(255, 0, 0, 0)),
                            child: child!,
                          ),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            pickedDateTime = DateTime(
                                pickedDate!.year,
                                pickedDate!.month,
                                pickedDate!.day,
                                pickedTime!.hour,
                                pickedTime!.minute);
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 99, 117, 129),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        'Pick Date & Time',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.grey,
                            ));
                          });

                      if (_titleController.text == "") {
                        const snackBar = SnackBar(
                          content: Text('Please give a name to your Item!'),
                          //  backgroundColor: Colors.grey[200],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                      } else if (_descController.text == "") {
                        const snackBar = SnackBar(
                          content:
                              Text('Please add a description for your Item!'),
                          //  backgroundColor: Colors.grey[200],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                      } else if (_minpriceController.text == "") {
                        const snackBar = SnackBar(
                          content: Text('Please add minPrice for your Item!'),
                          //  backgroundColor: Colors.grey[200],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                      } else if (image == null) {
                        const snackBar = SnackBar(
                          content: Text('No Image Selected!'),
                          //  backgroundColor: Colors.grey[200],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                      } else if (pickedDateTime == null) {
                        const snackBar = SnackBar(
                          content: Text(
                              'Please! select date and time for the auction!'),
                          //  backgroundColor: Colors.grey[200],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                      } else {
                        var bytes = image!
                            .readAsBytesSync(); // toconvert imageFile to bytes
                        var headers = {
                          'Authorization': 'Client-ID a46304488bff32c'
                        };
                        var request = http.MultipartRequest(
                            'POST', Uri.parse('https://api.imgur.com/3/image'));
                        request.fields.addAll({
                          'image': base64Encode(
                              bytes), // encoding bytes in base64 string for uploading
                        });
                        request.headers.addAll(headers);
                        http.StreamedResponse response = await request.send();
                        if (response.statusCode == 200) {
                          var data = await response.stream.bytesToString();
                          print(data);
                          var body = jsonDecode(data);
                          print(body);
                          imageURL = body["data"]["link"];
                        }

                        final user = User(
                          pname: _titleController.text,
                          pdesc: _descController.text,
                          Datetime: DateTime(
                              pickedDate!.year,
                              pickedDate!.month,
                              pickedDate!.day,
                              pickedTime!.hour,
                              pickedTime!.minute),
                          minprice: int.parse(_minpriceController.text),
                          bidder: '',
                          bidprice: int.parse(_minpriceController.text),
                          imgurl: imageURL,
                          seller: emailll.email.toString(),
                        );

                        createUser(user);

                        const snackBar = SnackBar(
                          content: Text('Yay! Item added!',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),

                          //  backgroundColor: Colors.grey[200],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 189, 55, 100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        'Save Data',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),
                    ),
                  ),
                ),
                // TextField('${pickedDateTime.toStirng()}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  String id;
  String bidder;
  int bidprice;
  String imgurl;
  int minprice;
  String pdesc;
  String pname;
  String seller;
  DateTime Datetime;
  User({
    this.id = '',
    required this.bidder,
    required this.bidprice,
    required this.minprice,
    required this.imgurl,
    required this.pdesc,
    required this.pname,
    required this.seller,
    required this.Datetime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'bidprice': bidprice,
        'imgurl': imgurl,
        'bidder': bidder,
        'minprice': minprice,
        'pdesc': pdesc,
        'pname': pname,
        'seller': seller,
        'Datetime': Datetime,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        bidprice: json['bidprice'],
        imgurl: json['imgurl'],
        bidder: json['bidder'],
        minprice: json['minprice'],
        pdesc: json['pdesc'],
        pname: json['pname'],
        seller: json['seller'],
        Datetime: (json['Datetime'] as Timestamp).toDate(),
      );
}

Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('Users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Widget buildUserCurr(User user) => (user != null &&
        user.Datetime.isBefore(DateTime.now()) &&
        user.Datetime.isAfter(DateTime.now().subtract(Duration(minutes: 30))))
    ? ItemCard(user: user)
    : Container();

Widget buildUserPast(User user) =>
    (user.Datetime.isBefore(DateTime.now().subtract(Duration(minutes: 30))))
        ? Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(30),
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF7a6c62),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "${user.pname}",
                      style: TextStyle(
                          fontSize: 30,
                          //  fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${user.Datetime.toString()}",
                      style: TextStyle(
                          fontSize: 20,
                          // fontFamily: 'sans-serif',
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
                      height: 200.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.bidder != ""
                          ? 'Sold for ₹${user.bidprice} to ${user.bidder}'
                          : "item not sold",
                      style: TextStyle(
                          // fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${user.pdesc}',
                        style: TextStyle(
                          // fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
                ],
              ),
            ))
        : Container();
Widget buildUserFut(User user) => (user.Datetime.isAfter(DateTime.now()))
    ? Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(30),
        elevation: 6.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF7a6c62),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "${user.pname}",
                  style: TextStyle(
                      fontSize: 30,
                      //  fontFamily: 'sans-serif',
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${user.Datetime.toString()}",
                  style: TextStyle(
                      fontSize: 20,
                      // fontFamily: 'sans-serif',
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
                  height: 200.0,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Minimum Bidding Price: ₹${user.minprice}',
                  style: TextStyle(
                      // fontFamily: 'sans-serif',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  child: Column(children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${user.pdesc}',
                    style: TextStyle(
                      // fontFamily: 'sans-serif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])),
            ],
          ),
        ))
    : Container();
