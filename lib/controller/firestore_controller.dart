import 'package:cars_store/models/post_model.dart';
import 'package:cars_store/models/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController extends GetxController {
  var user = UserModel().obs;
  var posts = <PostModel>[].obs;
  var post = PostModel().obs;
  var favouritePosts=<PostModel>[].obs;
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
   getFavouritePosts() {
        print('favouriteDocsID:${user.value.favourites}');
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
    }catch(e){}
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

  Future<void> getPosts() async {
    try{
    final snapshot = await _firestore.collectionGroup('posts').get();
    print('Docssss:${snapshot.docs}');
    posts.assignAll(snapshot.docs.map((doc) {
      return PostModel.fromMap(doc.id, doc.data());
    }).toList());}catch(e){}
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
