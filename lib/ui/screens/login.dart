import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/ui/screens/home.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      appBar: AppBar(
          titleSpacing: 1,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Login", style: TextStyle(color: const Color(0xff434343), fontFamily: 'Roboto-Medium', fontSize: 20,)),
          backgroundColor: const Color(0xffcfe9e5),
          leading: Icon(Icons.dehaze, color: const Color(0xff434343))
      ),

      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[

            SizedBox(height: 64.0),

            Text("_formKey = $_formKey)"),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                  if (input.isEmpty)
                    return "E-mail não deve ser vazio.";
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'E-mail'
                ),
              ),
            ),

            SizedBox(height: 20.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty)
                    return "Senha não deve ser vazia";
                },
                onSaved: (input) => _password = input,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Senha'
                ),
              ),
            ),

            SizedBox(height: 52.0),

            MaterialButton(
              color: const Color(0xff88c9bf),
              textColor: const Color(0xff434343),
              minWidth: 280,
              height: 40,
              child: Text("ENTRAR"),
              onPressed: () => signIn(),
            ),

            SizedBox(height: 72.0),


            MaterialButton(
                color: const Color(0xff194f7c),
                textColor: Colors.white,
                minWidth: 280,
                height: 40,
                child:
                FlatButton.icon(
                  icon: Icon(Icons.dehaze),
                  label: Text("ENTRAR COM FACEBOOK"),
                  textColor: Colors.white,
                  onPressed: () => print("Entrar com Facebook"),
                ),
              onPressed: () => print("Entrar com Google"),
            ),

            SizedBox(height: 8.0),

            MaterialButton(
                color: const Color(0xfff15f5c),
                textColor: Colors.white,
                minWidth: 280,
                height: 40,
                child:
                FlatButton.icon(
                  icon: Icon(Icons.dehaze),
                  label: Text("ENTRAR COM GOOGLE"),
                  textColor: Colors.white,
                  onPressed: () => print("Entrar com Google"),
                ),
              onPressed: () => print("Entrar com Google"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}

