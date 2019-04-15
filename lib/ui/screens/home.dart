import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:first_project/auth.dart';

class Home extends StatefulWidget {
  Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
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
              future: widget.user, // a Future<String> or null
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
              ),
            ),

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
                  widget.user = FirebaseAuth.instance.currentUser();
                });
              },
            ),

            SizedBox(height: 12.0),


            MaterialButton(  // Botão ajudar
              color: const Color(0xffffd358),
              textColor: const Color(0xff434343),
              minWidth: 232,
              height: 40,
              child: Text("AJUDAR"),
              onPressed: () => print("AJUDAR"),
            ),

            SizedBox(height: 12.0),

            MaterialButton(   // Botão cadastrar
              color: const Color(0xffffd358),
              textColor: const Color(0xff434343),
              minWidth: 232,
              height: 40,
              child: Text("CADASTRAR ANIMAL"),
              onPressed: () => print("CADASTRAR"),
            ),

            SizedBox(height: 44.0),

            FlatButton(  // link login
              textColor: const Color(0xff88c9bf),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("login"),),

            FlatButton(  // link login
              textColor: const Color(0xff88c9bf),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("cadastrar conta"),),

            Image.asset('assets/images/Meau_marca_2.png', alignment: Alignment.bottomCenter, width: 122), // imagem meau

          ],
        ),
      ),
    );
  }
}