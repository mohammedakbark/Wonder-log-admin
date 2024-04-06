import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wanderlog_admin/model/new_post.dart';

class Firecontroller with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //--------------------add

  //----------------------delete

  //--------------------update

  //---------------------reaad

  List<AddNewPost> listOfPost = [];
  Future fetchApprovedPost() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Post")
        .where("status", isEqualTo: "Approved")
        .get();
    listOfPost = snapshot.docs.map((e) {
      return AddNewPost.fromJson(e.data());
    }).toList();
    print(listOfPost.length);
  }
}
