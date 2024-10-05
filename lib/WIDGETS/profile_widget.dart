import 'package:flutter/material.dart';
import 'package:http_assignment/DataModels/photos_Model.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.photoList});
final Photo photoList;
  @override
  Widget build(BuildContext context) {
    return   
  GestureDetector(
    onTap: (){
      
    },
    child: Container( width: 50, height: 50, 
    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photoList.thumbnailUrl),fit: BoxFit.fill) ),),
  );

  }
}