import 'package:fb_miner/screen/book_page/model/book_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Fire_Helepr {
  Fire_Helepr._();

  static Fire_Helepr fire_helepr = Fire_Helepr._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void CtreateAccount(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<bool> ReadAccount(String email, String password) async {
    bool Login = false;
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password).then((value) {
      Login = true;
    }).catchError(
            (erro) {
          Login = false;
        });

    return Login;
  }

  Future<bool> checkUserLogin() async {
    if (await firebaseAuth.currentUser != null) {
      return true;
    }
    else {
      return false;
    }
  }

  void LogoutAccount() {
    firebaseAuth.signOut();
  }

  void addcategory(String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection("category").add({"name": name});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCategory() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return firebaseFirestore.collection("category").snapshots();
  }

  void deleteCategory(String id) {
    firebaseFirestore.collection("category").doc(id).delete();
  }

  void updateCategory(String name, String id) {
    firebaseFirestore.collection("category").doc(id).update({"name": name});
  }


  void addBook(Book_Model bookname) async {
    await firebaseFirestore.collection("books").add({
      "name": bookname.name,
      "image": bookname.image,
      "author_name": bookname.author_name,
      "author_about": bookname.author_about,
      "book_about": bookname.book_about,
      "rating": bookname.rating,
      "publish_year":bookname.publish_year,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readBook()
  {
    return firebaseFirestore.collection("books").snapshots();
  }

  void deleteBook(String id)
  {
    firebaseFirestore.collection("books").doc(id).delete();
  }

}