import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/model/user_model.dart';

class Firecontroller with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //--------------------add

  //----------------------delete
  Future deleteuserData(uid) async {
    await db.collection("User").doc(uid).delete();
    notifyListeners();
  }

  _deleteRejectedPost(docId) {
    db.collection("Post").doc(docId).delete();
  }

  //--------------------update
  updateTheRequestStatus(posyId, newStatus) async {
    if (newStatus == "Rejected") {
      _deleteRejectedPost(posyId);
    } else {
      await db.collection("Post").doc(posyId).update({"status": newStatus});
    }

    notifyListeners();
  }

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

  List<UserModel> userList = [];
  Future fetchAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapShot =
        await db.collection("User").get();
    userList = snapShot.docs.map((e) {
      return UserModel.fromJson(e.data());
    }).toList();
  }

  UserModel? selectedUserData;
  fetchSelectedUserDetail(uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection("User").doc(uid).get();
    if (snapshot.exists) {
      selectedUserData = UserModel.fromJson(snapshot.data()!);
    }
  }

  List<AddNewPost> pendingRequest = [];
  Future fetchPendingRequest() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Post")
        .where("status", isEqualTo: "Requested")
        .get();
    pendingRequest = snapshot.docs.map((e) {
      return AddNewPost.fromJson(e.data());
    }).toList();
    print(listOfPost.length);
  }
}
