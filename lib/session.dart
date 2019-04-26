import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Session {
  FirebaseUser currentUser;
  Map<String, String> userData = Map<String, String>();

  setCurrentUser() {
    //print("Trying to set current user...");
    FirebaseAuth.instance.onAuthStateChanged.listen((user){
      currentUser = user;
      print("Current user setted to ${currentUser.email} [key: ${currentUser.uid}]");
    });
  }

  loadData() {
    //print("Trying to load data from user...");
    try {
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
      });//.onError((e) => print("erro: " + e.message));
      print("Data from ${currentUser.email} loaded.");
    }
    catch(e) {
      print("erro: " + e.toString());
    }
  }
}

final Session session = Session();