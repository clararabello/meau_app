import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
        title: returnName(widget.user.uid),
      ),
      drawer: new Drawer(
          child: new Column(children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName:
                    StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection('users')
                    .document(widget.user.uid)
                    .snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text(snapshot.data['name']);
                }
              },
            ),
              accountEmail: Text(widget.user.email),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown, child: new Text("FL")),
            ),
            new ListTile(
              title: new Text('Meu perfil'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: widget.user)));

              },
            ),
            new ListTile(
              title: new Text('Form 2'),
              onTap: () {
                this.setState(() {
                  Text("Rola");
                });
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ]
          )
      ),


      body:
        Text("rola"),

    );
  }

  Widget returnName(String user) {
    StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance
          .collection('users')
          .document(user)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Text(snapshot.data['name']);
        }
      },
    );
  }
}

