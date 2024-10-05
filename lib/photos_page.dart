import 'package:flutter/material.dart';
import 'package:http_assignment/DataModels/photos_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http_assignment/WIDGETS/photos_widget.dart';


class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: GridView.builder(gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: photoList.length, itemBuilder: ((context, index){
          return PhotosWidget(photoList: photoList[index]);
        })),
      ),
    );
   
  }
}