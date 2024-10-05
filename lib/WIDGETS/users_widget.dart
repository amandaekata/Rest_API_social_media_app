import 'package:flutter/material.dart';
import 'package:http_assignment/DataModels/user_Model.dart';

class UsersWidget extends StatelessWidget {

  const UsersWidget({super.key, required this.userList});
final User userList;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Row( mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClipRRect( 
               borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Icon(Icons.person_2_outlined),),
            const SizedBox(width: 5,),
            Column( mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userList.username, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 2,),
                Text(userList.email),
               const  SizedBox(height: 10,),
              ],
            ),
          ],
        ),
      );
  }
}