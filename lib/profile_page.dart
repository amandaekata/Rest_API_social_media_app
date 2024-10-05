import 'package:flutter/material.dart';
import 'package:http_assignment/DataModels/photos_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http_assignment/WIDGETS/profile_widget.dart';




class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class  _ProfilePageState extends State<ProfilePage> {
  List<Photo> photoList =[];
  
  @override
  void initState() {
   getPhotos();
    super.initState();
  }

  void getPhotos() async {
     var url = Uri.https('jsonplaceholder.typicode.com', '/photos');
     var response =  await http.get(url);
      if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      for (var element in jsonResponse) {
        photoList.add(Photo.fromJson(element));
      }
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    
    
    
    Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           const SizedBox(height: 50,),
            const Row( mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
       Icon(Icons.person_2_outlined, size: 50,),
       SizedBox(width: 10,),
       Text('Amanda Ekata', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    ],
  ),
 const SizedBox(height: 1,),
            Expanded(
              child: GridView.builder(gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: photoList.length, itemBuilder: ((context, index){
                return ProfileWidget(photoList: photoList[index]);
              })),
            ),
          ],
        ),
      ),
    );
   
  }
}