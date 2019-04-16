import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Session {
  FirebaseUser currentUser;
  Map<String, String> userData = Map<String, String>();

  setCurrentUser(){
    FirebaseAuth.instance.onAuthStateChanged.listen((user){
      currentUser = user;
    });
  }

  loadData() {

    Firestore.instance
        .collection('users')
        .document(currentUser.uid).snapshots().listen((doc) {
            userData["age"] = doc["age"];
            userData["address"] = doc["address"];
            userData["city"] = doc["city"];
            userData["name"] = doc["name"];
            userData["state"] = doc["state"];
            userData["telephone"] = doc["telephone"];
            userData["username"] = doc["username"];
        });
//        .where("document", isEqualTo: currentUser.uid)
        /*.snapshots()
        .listen((data) => data.documents.forEach((doc) {

    }));*/
  }
}

final Session session = Session();