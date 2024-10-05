import 'package:flutter/material.dart';

import 'package:http_assignment/DataModels/posts_Model.dart';


class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key, required this.postList });
  final Comment postList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row( mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClipRRect( 
               borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Icon(Icons.person_2_outlined),),
            const SizedBox(width: 5,),
            Expanded( 
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(postList.title, style: const TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 2,),
                  Text(postList.body ),
                  
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}