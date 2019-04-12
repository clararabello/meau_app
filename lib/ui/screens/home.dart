import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: const Color(0xfffafafa),

        body:
        Center(
          child: Column(
            children: <Widget>[

              Container( // icone de menu
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
                ),
              ),
              //Text(user.email)

              /*StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document(user.uid)
                  .snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text(snapshot.data['age']);
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

              SizedBox(height: 48.0),

              //-----------------------------------------------------//


              MaterialButton( // Botão adotar
                color: const Color(0xffffd358),
                textColor: const Color(0xff434343),
                minWidth: 232,
                height: 40,
                child: Text("ADOTAR"),
                onPressed: () => print("ADOTAR"),
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
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/home');
          },
          child: Text("logout"),);

    } catch (e) {
      return SizedBox(height: 0);
    }
  }
}

