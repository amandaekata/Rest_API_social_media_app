//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http_assignment/DataModels/createpost_model.dart';
import 'package:http_assignment/DataModels/posts_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http_assignment/WIDGETS/home_pageWidget.dart';
import 'package:http_assignment/make_post.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comment> postList = [];

  // late final SharedPreferences prefs;
  // String? head;
  // String? tail;

  @override
  void initState() {
    getComment();

    super.initState();
  }

  void getComment() async {
    
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    
      for (var element in jsonResponse) {
        postList.add(Comment.fromJson(element));

      }
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HomePageWidget(postList: postList[index]);
                    })),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const ClipRRect(
            //         borderRadius: BorderRadius.all(Radius.circular(30)),
            //         child: Icon(Icons.person_2_outlined),
            //       ),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               '$title',
            //               style: const TextStyle(fontWeight: FontWeight.bold),
            //             ),
            //             const SizedBox(
            //               height: 2,
            //             ),
            //             Text('$body'),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () async {
    final newPost = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MakePost()),
    );

    if (newPost != null) {
      setState(() {
        postList.insert(0, newPost);
      });
    }
  },
  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
