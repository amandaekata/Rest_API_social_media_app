import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import 'DataModels/posts_Model.dart'; 

class MakePost extends StatefulWidget {
  const MakePost({super.key});

  @override
  State<MakePost> createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  late SharedPreferences prefs;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Controllers for TextFormField
  TextEditingController titleControl = TextEditingController();
  TextEditingController bodyControl = TextEditingController();

  // Create post request
 Future<void> createPost() async {
  final create = Uri.https('jsonplaceholder.typicode.com', '/posts');
  final response = await http.post(
    create,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': titleControl.text,
      'body': bodyControl.text,
    
    }),
  );

  if (response.statusCode == 201) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final post = Comment.fromJson(data);
    print(post);

    // Pop the current page and pass back the new post
    Navigator.pop(context, post);
  } else {
    print('Failed to create post. Status code: ${response.statusCode}');
  }
}


  @override
  void initState() {
    super.initState();
    initialize(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a post'),
        backgroundColor: const Color.fromARGB(255, 242, 215, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: titleControl,
              decoration: const InputDecoration(
                hintText: 'Title?',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bodyControl,
              decoration: const InputDecoration(
                hintText: 'Share your thoughts..',
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 242, 215, 255),
                fixedSize: const Size(200, 30),
              ),
              onPressed: () async {
                
               

                // Create the post
                await createPost();
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
