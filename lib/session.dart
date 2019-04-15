import 'package:firebase_auth/firebase_auth.dart';

class Session {
  FirebaseUser currentUser;

  setCurrentUser(){
    FirebaseAuth.instance.onAuthStateChanged.listen((user){
      currentUser = user;
    });
  }
}

final Session session = Session();