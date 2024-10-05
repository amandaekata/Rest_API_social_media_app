import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http_assignment/DataModels/user_Model.dart';
import 'package:http_assignment/WIDGETS/users_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> userList= [];
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  void getUsers() async{
 var url = Uri.https('jsonplaceholder.typicode.com', '/users');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      for (var element in jsonResponse) {
        userList.add(User.fromJson(element));
      }
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:    Column(
        children: [Expanded(child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index){
            return UsersWidget(userList: userList[index]);
          }
          
          ))],
      ),
    );
  }
}