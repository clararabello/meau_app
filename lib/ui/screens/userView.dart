import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/session.dart';

class UserView extends StatefulWidget {
  const UserView({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      appBar:
      new AppBar(
      ),
      drawer: new Drawer(
          child: new Column(children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(session.userData["name"]),
              accountEmail: Text(session.currentUser.email),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown, child: new Text("FL")),
            ),
            new ListTile(
              title: new Text('Meu perfil'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: widget.user)));

              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('Home'),
              onTap: () {
                this.setState(() {
                  Navigator.pushNamed(context, '/home');
                });
              },
            ),
            new Divider(),
          ]
          )
      ),


      body: Center(
        child: ListView(
          children: <Widget>[
            Text( // texto "Olá!"
                "sad",
                style: TextStyle(
                    fontFamily: 'Roboto-Medium',
                    fontSize: 16,
                    color: const Color(0xff434343)
                )),
                returnName()
          ])
      )
    );
  }

  Widget returnName(){
    String kk="lola do joao";
    //print("aaaaaaaa + " + Firestore.instance.collection("users").snapshots().toList().toString());
    Firestore.instance
        .collection('users')
        .where("name", isEqualTo: "Koda nascimento")
        .snapshots()
        .listen((data) => data.documents.forEach((doc) => print("bbb " + doc["city"])));
    return Text(kk);

    //((snapshot) => snapshot.data["name"]);
    //((snapshot) => print(snapshot.data["name"]));
   /* StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance
          .collection('users')
          .document(session.currentUser.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return snapshot.error;
        } else if (snapshot.hasData) {
          return snapshot.data['name'];
        }
        //return LinearProgressIndicator();
      },
    );*/
  }

}

