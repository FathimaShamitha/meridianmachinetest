/*
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class PostController extends ChangeNotifier{
  static const apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  List post = [];
  Future<void> getPosts() async {
    final response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      post = data;
      notifyListeners();
    } else {
      throw Exception('Error occurred while loading data');
    }
  }
}*/
