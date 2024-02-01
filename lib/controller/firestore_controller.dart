import 'package:cars_store/models/post_model.dart';
import 'package:cars_store/models/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController extends GetxController {
  var user = UserModel().obs;
  var posts = <PostModel>[].obs;
  var post = PostModel().obs;
  var _firestore = FirebaseFirestore.instance;
  var _auth = FirebaseAuth.instance;

  Future<void> getUser() async {
    try {
      final snapshot =
          await _firestore.collection('users').doc(_auth.currentUser?.uid);
      snapshot.get().then((value) {
        user.value = UserModel.fromMap(value.id, value.data());
      });
    } catch (e) {}
  }

  Future<void> addUser(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .set(user.toMap());
    } catch (e) {
      print(e);
    }
  }

  getPostById(String id) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('posts')
          .doc(id);
      snapshot.get().then((value){
            post.value=PostModel.fromMap(value.id, value.data());
      });
    } catch (e) {
    }
  }

  Future<void> getPosts() async {
    final snapshot = await _firestore.collectionGroup('posts').get();
    print('Docssss:${snapshot.docs}');
    posts.assignAll(snapshot.docs.map((doc) {
      return PostModel.fromMap(doc.id, doc.data());
    }).toList());
    print('possssstssss${posts[0].images}');
  }

  Future<void> addPost(PostModel post) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('posts')
          .doc()
          .set(post.toMap());
    } catch (e) {}
  }
}
