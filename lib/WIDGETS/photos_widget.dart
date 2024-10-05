import 'package:flutter/material.dart';
import 'package:http_assignment/DataModels/photos_Model.dart';

class PhotosWidget extends StatelessWidget {
  const PhotosWidget({super.key, required this.photoList});
  final Photo photoList;

  @override
  Widget build(BuildContext context) {
    return  
       Padding(
         padding: const EdgeInsets.all(2),
         child: Container( width: 50, height: 50, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photoList.thumbnailUrl),fit: BoxFit.fill) ),),
       );
 
     
  }
}