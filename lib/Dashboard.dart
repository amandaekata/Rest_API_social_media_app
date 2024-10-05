import 'package:flutter/material.dart';
import 'package:http_assignment/home_page.dart';
import 'package:http_assignment/photos_page.dart';
import 'package:http_assignment/profile_page.dart';
import 'package:http_assignment/user_page.dart';




class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // ignore: unused_field
  late PageController _controller;
  int index = 0;
@override
  void initState() {
   _controller = PageController(initialPage: 0);
    super.initState();
  }

  List pages =[
const HomePage(),
const PhotosPage(),
const UserPage(),
const ProfilePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
bottomNavigationBar: BottomNavigationBar( type: BottomNavigationBarType.fixed,
  onTap: (value){
    setState(() {
      index= value;
    });
  },
  backgroundColor: Colors.black,
  selectedItemColor: Colors.white,
  unselectedItemColor: const Color.fromARGB(255, 211, 211, 211),
  
  currentIndex: index,
  
  items: const  [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home',) ,
    BottomNavigationBarItem(icon: Icon(Icons.camera_alt) ,label: 'photos') ,
      BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: 'Users' ) ,
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined) ,label: 'Profile') ,
    

  ]),
  body: pages[index],


    );
  }
}