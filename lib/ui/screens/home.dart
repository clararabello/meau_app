import 'package:first_project/session.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:first_project/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/ui/screens/userView.dart';


class Home extends StatefulWidget {
  FirebaseUser user = session.currentUser;
  Future<FirebaseUser> futureUser = FirebaseAuth.instance.currentUser();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

        body:
        Center(
          child: Column(
            children: <Widget>[

            new FutureBuilder<FirebaseUser>(
              future: widget.futureUser, // a Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none: return new Text('Press button to start');
                  case ConnectionState.waiting: return new Text('Awaiting result...');
                  default:
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    else
                      return new Text('Result: ${snapshot.data}');
                }
              },
            ),

            FlatButton(
                child: Text("logout"),
                onPressed: () {
                  try {
                    AuthService().signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  } catch (e){
                    print("erro");
                  }
                }
            ),

            Container(    // icone de menu
              height: 56,
              padding: new EdgeInsets.only(left: 12, top: 12),
              alignment: Alignment.topLeft,
              child: Icon(Icons.dehaze, color: const Color(0xff88c9bf),),
            ),

            Text( // texto "Olá!"
              'Olá!',
              style: TextStyle(
                  fontFamily: 'Courgette-Regular',
                  fontSize: 72,
                  color: const Color(0xffffd358)
              )),
              //Text(user.email)

              /*StreamBuilder<DocumentSnapshot>(
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
                //return LinearProgressIndicator();
              },
            ),*/

              SizedBox(height: 52.0),

            Text( // Texto inicial
                'Bem vindo ao Meau! \n Aqui você pode adotar, doar e ajudar \n '
                    'cães e gatos com facilidade. \n Qual o seu interesse?',
                style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 16,
                    color: const Color(0xff757575)
                ),
                textAlign: TextAlign.center
            ),
              Text( // Texto inicial
                  'Bem vindo ao Meau! \n Aqui você pode adotar, doar e ajudar \n '
                      'cães e gatos com facilidade. \n Qual o seu interesse?',
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 16,
                      color: const Color(0xff757575)
                  ),
                  textAlign: TextAlign.center
              ),

              SizedBox(height: 48.0),

            MaterialButton( // Botão adotar
              color: const Color(0xffffd358),
              textColor: const Color(0xff434343),
              minWidth: 232,
              height: 40,
              child: Text("ADOTAR"),
              onPressed: () {
                setState(() {
                  /*FirebaseAuth.instance.onAuthStateChanged.listen((user) {
                    print(user);
                  });*/
                  session.setCurrentUser();
                  print("o usuario é ${session.currentUser.uid}");
                  widget.futureUser = FirebaseAuth.instance.currentUser();
                });
              },
            ),

              SizedBox(height: 12.0),


              MaterialButton( // Botão ajudar
                color: const Color(0xffffd358),
                textColor: const Color(0xff434343),
                minWidth: 232,
                height: 40,
                child: Text("AJUDAR"),
                onPressed: () => print("AJUDAR"),
              ),

              SizedBox(height: 12.0),

              MaterialButton( // Botão cadastrar
                color: const Color(0xffffd358),
                textColor: const Color(0xff434343),
                minWidth: 232,
                height: 40,
                child: Text("CADASTRAR ANIMAL"),
                onPressed: () => print("CADASTRAR"),
              ),

              SizedBox(height: 44.0),


              retorna_login(context),

              retorna_cadastro(context),

              retorna_logout(context),

              SizedBox(height: 68.0),

              Image.asset(
                'assets/images/Meau_marca_2.png', alignment: Alignment.center,
                width: 122,), // imagem meau

            ],
          ),
        ),
      );
  }


    Widget retorna_login(BuildContext context) {
      try {
        if (widget.user.email == null);
        return SizedBox(height: 0);
      } catch (e) {
        return FlatButton( // link login
          textColor: const Color(0xff88c9bf),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text("login"),);
      }
    }

    Widget retorna_cadastro(BuildContext context) {
      try {
        if (widget.user.email == null);
        return SizedBox(height: 0);
      } catch (e) {
        return
          FlatButton( // link login
            textColor: const Color(0xff88c9bf),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text("cadastrar conta"),);
      }
    }

  Widget retorna_logout(BuildContext context) {
    try {
      if (widget.user.email == null);
      return
        FlatButton( // link logout
          textColor: const Color(0xff88c9bf),
          onPressed: () {
            //FirebaseAuth.instance.signOut();
            //Navigator.pushNamed(context, '/userView');
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: widget.user)));
          },
          child: Text("logout"),);

    } catch (e) {
      return SizedBox(height: 0);
    }
  }
}

