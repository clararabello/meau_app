import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/session.dart';
import 'package:first_project/ui/screens/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  // Dependencies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  // Shared State for Widgets
  Observable<FirebaseUser> user; // firebase user
  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  PublishSubject loading = PublishSubject();

  // constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);
    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    // Start
    loading.add(true);

    // Step 1
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Step 2
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
        )
    ).catchError((e) => print(e.message));
    // Step 3
    updateUserData(user);

    // Done
    loading.add(false);
    print("signed in " + user.displayName);
    return user;
  }

  emailAndPasswordSignIn(String email, String password, BuildContext context) async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Signed in " + email);

      session.setCurrentUser();
      await Future.delayed(Duration(seconds: 1));
      session.loadData();
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacementNamed('/home');

    }
    catch(e) {
      print("User not signed in: ${e.toString()}");
      Navigator.pop(context);
      var dialogs = new Dialogs();
      dialogs.information(context, "E-mail ou senha incorretos.");
    }
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void signOut() {
    _auth.signOut();
    session.currentUser = null;
    session.userData = Map<String, String>();
    print("User signed out");
  }
}

final AuthService authService = AuthService();