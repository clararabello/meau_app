import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
          titleSpacing: 1,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Login", style: TextStyle(color: const Color(0xff434343))),
          backgroundColor: const Color(0xffcfe9e5),
          leading: Icon(Icons.dehaze, color: const Color(0xff434343))
      ),
      body:
      Center(

        child: Column(

          children: <Widget>[
            // Space between "Recipes" and the button:

            SizedBox(height: 64.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome de usuário'
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
              onPressed: () => print("Entrar"),
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
                  )

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
                )

            )
          ],
        ),
      ),
    );
  }
}