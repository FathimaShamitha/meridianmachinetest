import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreenClass extends StatefulWidget {
  const HomeScreenClass({Key? key}) : super(key: key);

  @override
  State<HomeScreenClass> createState() => _HomeScreenClassState();
}

class _HomeScreenClassState extends State<HomeScreenClass> {
  List posts = [];

  Future<void> getPosts() async {
    var res =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      posts = data;
    } else {
      throw Exception("Api Error!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  image: AssetImage("assets/images/Ellipse 2.png"),
                )),
          ),
        ),
        actions: /*[Image(image: AssetImage("assets/images/Group.png"),),SizedBox(width: 10,)]*/
            [
          Icon(CupertinoIcons.bell),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Social Media Posts",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange),
                  child: Center(
                      child: Text(
                    "Trending",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Center(
                      child: Text(
                    "Relationship",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Center(
                      child: Text(
                    "Self Care",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 800,
              child: FutureBuilder(
                future: getPosts(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1,
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Image(
                                image:
                                    AssetImage("assets/images/Ellipse 3.png"),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${posts[index]["title"]}",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/Vector.png")),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image(
                                        image: AssetImage(
                                            "assets/images/Group 84.png")),
                                    SizedBox(
                                      width: 150,
                                    ),
                                    Image(
                                        image: AssetImage(
                                            "assets/images/bx_share.png"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
