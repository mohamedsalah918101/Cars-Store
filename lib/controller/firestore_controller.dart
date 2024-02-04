import 'package:cars_store/models/post_model.dart';
import 'package:cars_store/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController extends GetxController {
  var user = UserModel().obs;
  var posts = <PostModel>[].obs;
  var post = PostModel().obs;
  var favouritePosts=<PostModel>[].obs;
  var _firestore = FirebaseFirestore.instance;
  var _auth = FirebaseAuth.instance;
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      textColor: Colors.white,
    );
  }
  Future<void> getUser() async {
    try {
      final snapshot =
          await _firestore.collection('users').doc(_auth.currentUser?.uid);
      snapshot.get().then((value) {
        user.value = UserModel.fromMap(value.id, value.data());
      });
    } catch (e) {
      _showToast('Something Wrong');
    }
  }
   getFavouritePosts() {
        favouritePosts.clear();
        for(var post in posts){
          if(user.value.favourites!.contains(post.id)){
              favouritePosts.add(post);
          }
        }
  }
  Future<void> addRemoveFavourites(String? id)async {
    try{
      bool exist=user.value.isFavourited(id);
      if(exist==true){
        await _firestore.collection('users').doc(_auth.currentUser?.uid).update({
          'favourites':FieldValue.arrayRemove([id])
        });
      }else{
        await _firestore.collection('users').doc(_auth.currentUser?.uid).update({
          'favourites':FieldValue.arrayUnion([id])
        });
      }
      getUser();
    }catch(e){
      _showToast('Something Wrong');
    }
  }

  Future<void> addUser(UserModel user) async {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .set(user.toMap());
  }

  Future<void> getPosts() async {
    try{
    final snapshot = await _firestore.collectionGroup('posts').get();
    posts.assignAll(snapshot.docs.map((doc) {
      return PostModel.fromMap(doc.id, doc.data());
    }).toList());}catch(e){
      _showToast('Something Wrong');
    }
  }

  Future<void> addPost(PostModel post) async {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('posts')
          .doc()
          .set(post.toMap());
  }
}
