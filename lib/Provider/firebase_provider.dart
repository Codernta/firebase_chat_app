
import 'package:chat_app_firebase/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider extends ChangeNotifier{
  List<UserModel> users = [];
  UserModel? user;

  List<UserModel> getAllUsers(){
    FirebaseFirestore.instance.collection('users').snapshots(includeMetadataChanges: true).listen((users) {
      this.users = users.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
    notifyListeners();
    });
    return users;
  }}